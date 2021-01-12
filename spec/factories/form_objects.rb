FactoryBot.define do
  factory :form_object do
    token         {"tok_abcdefghijk00000000000000000"}
    postal_code   {'111-1111'}
    prefecture_id {2}
    municipality  {"神戸市"}
    address_num   {"111-11"}
    building_name {"ABC"}
    phone_num     {'11111111111'}
  end
end
