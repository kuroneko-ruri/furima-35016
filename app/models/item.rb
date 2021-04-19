class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :cost
  belongs_to :prefecture
  belongs_to :shipping_day

  with_options presence: true do
    validates :name
    validates :description
    validates :image
  end

  with_options presence: true, numericality: { other_than: 1, message: 'を選んでください' } do
    validates :category_id
    validates :condition_id
    validates :cost_id
    validates :shipping_day_id
    validates :prefecture_id
  end

  validates :price, presence: true, format: {
    with: /\A[0-9]+\z/, message: 'は半角数字で入力してください'
  }, numericality: {
    greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'は設定範囲内で入力してください'
  }
end
