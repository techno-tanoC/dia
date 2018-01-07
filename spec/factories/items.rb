# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  title      :string
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :item do
    title "MyString"
    url "MyString"
  end
end
