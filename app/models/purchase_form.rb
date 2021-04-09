class PurchaseForm
  include ActiveModel::Model

  attr_accessor :user, :item
  with_options presence: true do
    validates :user
    validates :item
  end

  def save
    user =  User.create(nickname: nickname, email: email, password: password, first_name: first_name, last_name: last_name, first_name_kana: first_name_kana, last_name_kana: last_name_kana, birth_day: birth_day)
    Item.create(name: name, introduction: introduction, category_id: category.id, condition_id: condition.id, cost_id: cost.id, prefecture_id: prefecture.id, shipping_day_id: shipping_day.id, price: price, user_id: user.id)
  end
end