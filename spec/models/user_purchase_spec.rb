require 'rails_helper'

RSpec.describe UserPurchase, type: :model do
  before do
    seller = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    sleep 0.5
    @user_purchase = FactoryBot.build(:user_purchase, user_id: seller.id, item_id: item.id)
  end

  it 'すべての値が正しく入力されていれば保存できること' do
    expect(@user_purchase).to be_valid
  end

  it 'tokenが空では保存できないこと' do
    @user_purchase.token = ''
    @user_purchase.valid?
    expect(@user_purchase.errors.full_messages).to include("Token can't be blank")
  end
  it '郵便番号が空では保存できないこと' do
    @user_purchase.postal_code = ''
    @user_purchase.valid?
    expect(@user_purchase.errors.full_messages).to include("Postal code can't be blank")
  end
  it '郵便番号にハイフンがなければ保存できないこと' do
    @user_purchase.postal_code = '1111111'
    @user_purchase.valid?
    expect(@user_purchase.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
  end

  it '都道府県が１では保存できないこと' do
    @user_purchase.prefecture = 1
    @user_purchase.valid?
    expect(@user_purchase.errors.full_messages).to include("Prefecture can't be blank")
  end
  it '市区町村が空では保存できないこと' do
    @user_purchase.city = ''
    @user_purchase.valid?
    expect(@user_purchase.errors.full_messages).to include("City can't be blank")
  end

  it '番地が空では保存できないこと' do
    @user_purchase.address = ''
    @user_purchase.valid?
    expect(@user_purchase.errors.full_messages).to include("Address can't be blank")
  end
  it '電話番号が空では保存できないこと' do
    @user_purchase.phone_number = ''
    @user_purchase.valid?
    expect(@user_purchase.errors.full_messages).to include("Phone number can't be blank")
  end
  it '電話番号にハイフンが入っていては保存できないこと' do
    @user_purchase.phone_number = '111-111'
    @user_purchase.valid?
    expect(@user_purchase.errors.full_messages).to include('Phone number is invalid. Phone number Input only number')
  end
  it '電話番号が12桁以上では保存できないこと' do
    @user_purchase.phone_number = '111111111111111'
    @user_purchase.valid?
    expect(@user_purchase.errors.full_messages).to include('Phone number is invalid. Phone number Input only number')
  end

  it 'user_idが空では保存できないこと' do
    @user_purchase.user_id = ''
    @user_purchase.valid?
    expect(@user_purchase.errors.full_messages).to include("User can't be blank")
  end

it 'item_idが空では保存できないこと' do
  @user_purchase.item_id = ''
  @user_purchase.valid?
  expect(@user_purchase.errors.full_messages).to include("Item can't be blank")
end

end