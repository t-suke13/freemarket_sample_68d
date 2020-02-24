class CreditCardsController < ApplicationController
  require "payjp"
  include CardsHelper

  def new #新規登録画面でアドレス登録後にページ遷移。スキップ可。
    @card_logo = card_logo
  end

  def edit #既にcard登録していた場合、マイページの編集ページに遷移
    card = CreditCard.where(user_id: current_user.id)
    @card_logo = card_logo
    redirect_to action: "show" if card.exists?
  end

  def pay #payjpとCardのデータベース作成を実施します。
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjp-token'].blank?
      error_path(params[:location])
    else
      customer = Payjp::Customer.create(
      card: params['payjp-token'],
      )
      @card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        success_path(params[:location])
      else
        redirect_to action: "pay"
      end
    end
  end

  def delete #PayjpとCardデータベースを削除します
    card = CreditCard.where(user_id: current_user.id).first
    if card.present?
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to action: "edit"
  end

  def show #Cardのデータpayjpに送り情報を取り出します
    card = CreditCard.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "edit" 
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      default_card_information = customer.cards.retrieve(card.card_id)
      @card_number = "**** **** **** " + default_card_information.last4
      @exp_month = default_card_information.exp_month.to_s.rjust(2, "0")
      @exp_year = default_card_information.exp_year.to_s.slice(2,3)
      @card_name = default_card_information.name.to_s
      @card_brand = card_company(default_card_information.brand)
    end
  end

  private
  #マイページと新規登録画面で、エラー時のリダイレクト先を分岐
  def error_path(location)
    if location == "edit"
      redirect_to  action: "edit"
    else
      redirect_to  action: "new"
    end
  end

  #マイページと新規登録画面で、登録完了時のリダイレクト先を分岐
  def success_path(location)
    if location == "edit"
      redirect_to  action: "show"
    else
      redirect_to  root_path
    end
  end
end
