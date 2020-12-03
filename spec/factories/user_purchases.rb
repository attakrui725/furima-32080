FactoryBot.define do
  factory :user_purchase do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code  { '111-1111' }
    prefecture   { 2 }
    city         { '加東市' }
    address      { 'あああああ' }
    building     { '本田マンション' }
    phone_number { '09044441111' }

  end
end
