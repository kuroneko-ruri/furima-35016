require 'rails_helper'

RSpec.describe PurchaseOrder, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_order = FactoryBot.build(:purchase_order, user_id: user.id, item_id: item.id)
    sleep(1)
  end
  describe '商品購入確認' do
    context '商品購入がうまくいく時' do
      it '全ての値が正しく入力されていれば購入できること' do
        expect(@purchase_order).to be_valid
      end
      it 'building_nameが空でも登録できる' do
        @purchase_order.building_name = nil
        expect(@purchase_order).to be_valid
      end
    end
    context '商品購入がうまくいかない時' do
      it 'post_codeが空だと購入できない' do
        @purchase_order.post_code = nil
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeにハイフンがないと購入できない' do
        @purchase_order.post_code = "1234567"
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'prefectureが未選択だと購入できない' do
        @purchase_order.prefecture_id = 1
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Prefecture Select")
      end
      it 'cityが空だと購入できない' do
        @purchase_order.city = nil
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと購入できない' do
        @purchase_order.address = nil
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと購入できない' do
        @purchase_order.phone_number = nil
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが10桁以下だと購入できない' do
        @purchase_order.phone_number = "0901234567"
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Phone number Input only number")
      end
      it "tokenが空では登録できないこと" do
        @purchase_order.token = nil
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end