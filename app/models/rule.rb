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

require 'timeout'

class Rule < ApplicationRecord
  validates :regex, :tag, presence: true
  validates :target, inclusion: { in: %w(title url), message: "target is 'title' or 'url'" }

  def apply(item)
    Timeout.timeout(1) do
      if match?(item)
        item.tag_list.add(self.tag)
      end
    end
  end

  private
  def match?(item)
    title_match = title_target? && item.title =~ /#{self.regex}/
    url_match = url_target? && item.url =~ /#{self.regex}/
    title_match || url_match
  end

  def title_target?
    self.target == "title"
  end

  def url_target?
    self.target == "url"
  end
end
