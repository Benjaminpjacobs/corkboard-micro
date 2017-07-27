FactoryGirl.define do
  factory :record do
    name {Faker::Commerce.department(1)}
    object {Faker::Commerce.department(1)}
    local_id {generate(:local_id)}
    slug {Faker::Commerce.department(1)}
    uri {Faker::Commerce.department(1)}
  end

  sequence :local_id do |i|
    i
  end

end
