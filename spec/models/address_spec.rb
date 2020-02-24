require 'rails_helper'

describe Address do
  describe 'address#create' do
    it "is valid with a postal_code, prefecture_id, address1, address2, user_id" do
      address = build(:address)
      expect(address).to be_valid
    end

    it "is invalid without a postal_code" do
      address = build(:address, postal_code: nil)
      address.valid?
      expect(address.errors[:postal_code]).to include("を入力してください。")
    end

    it "is invalid without a prefecture_id" do
      address = build(:address, prefecture_id: nil)
      address.valid?
      expect(address.errors[:prefecture_id]).to include("を入力してください。")
    end

    it "is invalid without a address1" do
      address = build(:address, address1: nil)
      address.valid?
      expect(address.errors[:address1]).to include("を入力してください。")
    end

    it "is invalid without a address2" do
      address = build(:address, address2: nil)
      address.valid?
      expect(address.errors[:address2]).to include("を入力してください。")
    end

    it "postal_code is invalid without numbers and hyphens" do
      address = build(:address, postal_code: "abcdefg")
      address.valid?
      expect(address.errors[:postal_code]).to include("の入力が正しくありません。郵便番号はハイフンを含めて入力して下さい。")
    end

    it "postal_code is invalid if there is no hyphen in between" do
      address = build(:address, postal_code: "1234567")
      address.valid?
      expect(address.errors[:postal_code]).to include("の入力が正しくありません。郵便番号はハイフンを含めて入力して下さい。")
    end

    it "postal_code is invalid unless the first half is 3 characters" do
      address = build(:address, postal_code: "1234-5678")
      address.valid?
      expect(address.errors[:postal_code]).to include("の入力が正しくありません。郵便番号はハイフンを含めて入力して下さい。")
    end

    it "postal_code is invalid if the latter half is not 4 characters" do
      address = build(:address, postal_code: "123-456")
      address.valid?
      expect(address.errors[:postal_code]).to include("の入力が正しくありません。郵便番号はハイフンを含めて入力して下さい。")
    end

  end
end