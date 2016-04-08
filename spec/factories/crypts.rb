FactoryGirl.define do
  factory :crypt do
    decrypt "MyString"
    encrypt "MyString"
    shift 1
  end
end
