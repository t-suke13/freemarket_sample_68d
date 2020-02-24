require 'rails_helper'

describe CreditCard do
  describe 'credit_card#create' do
    it "is valid with a customer_id, card_id, user_id" do
      credit_card = build(:credit_card)
      expect(credit_card).to be_valid
    end

    it "is invalid without a customer_id" do
      credit_card = build(:credit_card, customer_id: nil)
      credit_card.valid?
      expect(credit_card.errors[:customer_id]).to include("を入力してください。")
    end

    it "is invalid without a card_id" do
      credit_card = build(:credit_card, card_id: nil)
      credit_card.valid?
      expect(credit_card.errors[:card_id]).to include("を入力してください。")
    end
  end
end
