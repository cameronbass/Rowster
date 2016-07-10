FactoryGirl.define do
  factory :subscriber do
    first_name "Tyler"
    last_name "Durden"
    sequence(:email) { |n| "tyler#{n}@rowst.com" }  
    phone_number "6168765555"
  end
end
