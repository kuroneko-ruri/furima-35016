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
        expect(@purchase_order.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'post_codeにハイフンがないと購入できない' do
        @purchase_order.post_code = "1234567"
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("郵便番号にハイフンをつけてください")
      end
      it 'prefectureが未選択だと購入できない' do
        @purchase_order.prefecture_id = 1
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("都道府県を選んでください")
      end
      it 'cityが空だと購入できない' do
        @purchase_order.city = nil
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'addressが空だと購入できない' do
        @purchase_order.address = nil
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("番地を入力してください")
      end
      it 'phone_numberが空だと購入できない' do
        @purchase_order.phone_number = nil
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'phone_numberが10桁か11桁じゃないと購入できない' do
        @purchase_order.phone_number = "090123"
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("電話番号は数字のみで入力してください")
      end
      it 'phone_numberが英数混合だと購入できない' do
        @purchase_order.phone_number = "12345abcde"
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("電話番号は数字のみで入力してください")
      end
      it 'user_idが空では購入できない' do
        @purchase_order.user_id = nil
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Userを入力してください")
      end
      it 'item_idが空では購入できない' do
        @purchase_order.item_id = nil
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Itemを入力してください")
      end
      it "tokenが空では登録できないこと" do
        @purchase_order.token = nil
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
    end
  end
end