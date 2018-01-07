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

require 'rails_helper'

RSpec.describe Rule, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
