require 'rails_helper'

describe Order do
  describe 'order#create' do
    it "is valid with a user_id, item_id" do
      order = build(:order)
      expect(order).to be_valid
    end

    it "is invalid without a user_id" do
      order = build(:order, user_id: nil)
      order.valid?
      expect(order.errors[:user_id]).to include("を入力してください。")
    end

    it "is invalid without a item_id" do
      order = build(:order, item_id: nil)
      order.valid?
      expect(order.errors[:item_id]).to include("を入力してください。")
    end
  end
end
