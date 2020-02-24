require 'rails_helper'

describe ItemImage do
  describe 'item_image#create' do
    describe 'presence: true 'do

      it "is valid with a url" do
        item_image = build(:item_image)
        expect(item_image).to be_valid
      end

      it "is invalid without a url" do
        item_image = build(:item_image, url: nil)
        item_image.valid?
        expect(item_image.errors[:url]).to include("を入力してください。")
      end


    end
  end
end