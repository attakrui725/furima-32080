require 'rails_helper'

RSpec.describe UserPurchase, type: :model do
  before do
    seller = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @user_purchase = FactoryBot.build(:user_purchase, user_id: seller.id, item_id: item.id)
  end


  it 'すべての値が正しく入力されていれば保存できること' do
      expect(@user_purchase).to be_valid
  end
end

it 'tokenが空では保存できないこと' do
end
it '郵便番号が空では保存できないこと' do
end
it '郵便番号にハイフンがなければ保存できないこと' do
end

it '都道府県が１では保存できないこと' do
end
it '市区町村が空では保存できないこと' do
end
it '番地が空では保存できないこと' do
end
it '電話番号が空では保存できないこと' do
end


- 配送先の情報として、郵便番号・都道府県・市区町村・番地・電話番号が必須であること
- 郵便番号にはハイフンが必要であること（123-4567となる）
- 電話番号にはハイフンは不要で、11桁以内であること（09012345678となる）
- 購入が完了したら、トップページまたは購入完了ページに遷移すること
- エラーハンドリングができていること（適切では無い値が入力された場合、情報は保存されず、エラーメッセージを出力させること）
- 入力に問題がある状態で購入ボタンが押されたら、購入ページに戻りエラーメッセージが表示されること