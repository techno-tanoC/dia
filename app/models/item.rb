class Item < ApplicationRecord
  acts_as_taggable

  validates :title, :url, presence: true

  scope :title_cont, ->(title) {
    where("lower(title) LIKE ?", "%#{title.downcase}%")
  }
  scope :url_cont, ->(url) {
    where("lower(url) LIKE ?", "%#{url.downcase}%")
  }
  scope :title_or_url_cont, ->(word) {
    where(
      "lower(title) LIKE ? OR lower(url) LIKE ?",
      "%#{word.downcase}%",
      "%#{word.downcase}%"
    )
  }
end
