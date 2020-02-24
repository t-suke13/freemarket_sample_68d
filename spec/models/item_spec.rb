require 'rails_helper'

describe Item do
  describe 'item#create' do

    describe 'presence: true' do

      it "is valid with a name, description, price, prefrcture_id, condition_id, shipping_fee_who_id, shipping_days_id" do
        item = build(:item)
        expect(item).to be_valid
      end

      it "is invalid without a name" do
        item = build(:item, name: nil)
        item.valid?
        expect(item.errors[:name]).to include("を入力してください。")
      end

      it "is invalid without a description" do
        item = build(:item, description: nil)
        item.valid?
        expect(item.errors[:description]).to include("を入力してください。")
      end

      it "is invalid without a price" do
        item = build(:item, price: nil)
        item.valid?
        expect(item.errors[:price]).to include("を入力してください。")
      end

      it "is invalid without a prefecture_id" do
        item = build(:item, prefecture_id: nil)
        item.valid?
        expect(item.errors[:prefecture_id]).to include("を入力してください。")
      end

      it "is invalid without a condition_id" do
        item = build(:item, condition_id: nil)
        item.valid?
        expect(item.errors[:condition_id]).to include("を入力してください。")
      end

      it "is invalid without a shipping_fee_who_id" do
        item = build(:item, shipping_fee_who_id: nil)
        item.valid?
        expect(item.errors[:shipping_fee_who_id]).to include("を入力してください。")
      end

      it "is invalid without a shipping_days_id" do
        item = build(:item, shipping_days_id: nil)
        item.valid?
        expect(item.errors[:shipping_days_id]).to include("を入力してください。")
      end

      it "is invalid without a user_id" do
        item = build(:item, user_id: nil)
        item.valid?
        expect(item.errors[:user]).to include("を入力してください。")
      end
    end


    describe "character length" do

      it "is valid with a name that has less than 40 characters " do
        item = build(:item)
        item.valid?
        expect(item).to be_valid
      end

      it "is invalid with a name that has more than 41 characters " do
        item = build(:item, name: "[10字]ジャケット[20字]ジャケット[30字]ジャケット[40字]ジャケット[45字]")
        item.valid?
        expect(item.errors[:name]).to include("は40文字以内で入力してください。")
      end

      it "is valid with a description that has less than 1000 characters " do
        item = build(:item, description: "ジャケット")
        item.valid?
        expect(item).to be_valid
      end

      it "is invalid with a description that has more than 1001 characters " do
        item = build(:item, description: "[20字]こちらは商品の説明になります。[40字]こちらは商品の説明になります。[60字]こちらは商品の説明になります。[80字]こちらは商品の説明になります。[100字]こちらは商品の説明になります。[20字]こちらは商品の説明になります。[40字]こちらは商品の説明になります。[60字]こちらは商品の説明になります。[80字]こちらは商品の説明になります。[200字]こちらは商品の説明になります。[20字]こちらは商品の説明になります。[40字]こちらは商品の説明になります。[60字]こちらは商品の説明になります。[80字]こちらは商品の説明になります。[300字]こちらは商品の説明になります。[20字]こちらは商品の説明になります。[40字]こちらは商品の説明になります。[60字]こちらは商品の説明になります。[80字]こちらは商品の説明になります。[400字]こちらは商品の説明になります。[20字]こちらは商品の説明になります。[40字]こちらは商品の説明になります。[60字]こちらは商品の説明になります。[80字]こちらは商品の説明になります。[500字]こちらは商品の説明になります。[20字]こちらは商品の説明になります。[40字]こちらは商品の説明になります。[60字]こちらは商品の説明になります。[80字]こちらは商品の説明になります。[600字]こちらは商品の説明になります。[20字]こちらは商品の説明になります。[40字]こちらは商品の説明になります。[60字]こちらは商品の説明になります。[80字]こちらは商品の説明になります。[700字]こちらは商品の説明になります。[20字]こちらは商品の説明になります。[40字]こちらは商品の説明になります。[60字]こちらは商品の説明になります。[80字]こちらは商品の説明になります。[800字]こちらは商品の説明になります。[20字]こちらは商品の説明になります。[40字]こちらは商品の説明になります。[60字]こちらは商品の説明になります。[80字]こちらは商品の説明になります。[900字]こちらは商品の説明になります。[20字]こちらは商品の説明になります。[40字]こちらは商品の説明になります。[60字]こちらは商品の説明になります。[80字]こちらは商品の説明になります。[1001字]こちらは商品の説明になります。")
        item.valid?
        expect(item.errors[:description]).to include("は1000文字以内で入力してください。")
      end
    end


    describe "numericality" do

      it "is valid with a price more than 300 and less than 9999999 " do
        item = build(:item)
        item.valid?
        expect(item).to be_valid
      end

      it "is invalid with a price less than 299 " do
        item = build(:item, price: "299")
        item.valid?
        expect(item.errors[:price]).to include("は300より大きい値にしてください。")
      end

      it "is invalid with a price more than 10000000 " do
        item = build(:item, price: "10000000")
        item.valid?
        expect(item.errors[:price]).to include("は9999999より小さい値にしてください")
      end
    end


    describe "numericality" do

      it "is invalid with a price which is not put in integer" do
        item = build(:item, price: "テスト")
        item.valid?
        expect(item.errors[:price]).to include("は数値で入力してください")
      end

      it "is invalid with a price which is put in integer and others" do
        item = build(:item, price: "テスト123")
        item.valid?
        expect(item.errors[:price]).to include("は数値で入力してください")
      end

      it "is invalid with a price which is put in full-width character" do
        item = build(:item, price: "１２３４５")
        item.valid?
        expect(item.errors[:price]).to include("は数値で入力してください")
      end

    end
  end
end