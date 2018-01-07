# == Schema Information
#
# Table name: rules
#
#  id         :integer          not null, primary key
#  target     :string
#  regex      :string
#  tag        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :rule do
    target "MyString"
    regex "MyString"
    tag "MyString"
  end
end
