class Item < ApplicationRecord
  acts_as_taggable

  validates :title, :url, presence: true
end
