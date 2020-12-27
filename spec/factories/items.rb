FactoryBot.define do

  factory :item do
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    product_name            {"test"}
    explanation             {"test"}
    category_id             {2}
    state_id                {2}
    bearer_id               {2}
    prefecture_id           {2}
    delivery_date_id        {2}
    price                   {1000}
    association :user
  end
end
