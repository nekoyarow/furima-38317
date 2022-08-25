require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@order_address).to be_valid
      end
      it 'address2は空でも保存できる' do
        @order_address.address2 = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'zipcodeが空だと保存できない' do
        @order_address.zipcode = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Zipcode can't be blank", "Zipcode is invalid. Include hyphen(-)")
      end
      it 'zipcodeが半角のハイフンを含んだ正しい形式でないと保存できない' do
        @order_address.zipcode = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Zipcode is invalid. Include hyphen(-)")
      end
      it 'area_idが1では保存できない' do
        @order_address.area_id = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Area can't be blank")
      end
      it 'cityが空では保存できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'address1が空では保存できない' do
        @order_address.address1 = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address1 can't be blank")
      end
      it 'phoneが空では保存できない' do
        @order_address.phone = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone can't be blank")
      end
      it 'phoneが9文字以下では保存できない' do
        @order_address.phone = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is invalid.")
      end
      it 'phoneが12文字以上では保存できない' do
        @order_address.phone = '090123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is invalid.")
      end
      it 'phoneが半角数値以外では保存できない' do
        @order_address.phone = '０９０１２３４５６７８'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is invalid.")
      end
      it 'tokenが空では保存できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐づいていないと保存できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")

      end
      it 'itemが紐づいてないと保存できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")

      end
    end
  end
end
