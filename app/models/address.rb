class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user, optional: true
  belongs_to_active_hash :prefecture

  validates :address1, :address2, :prefecture_id, presence: true
  validates :postal_code, presence: true,
            format: {
              with: /\A[0-9]{3}-[0-9]{4}\z/,
              message: "の入力が正しくありません。郵便番号はハイフンを含めて入力して下さい。"
            }
end
