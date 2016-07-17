class Job < ApplicationRecord
  belongs_to :company
  belongs_to :category
  validates :title, :location, :description, :category_id, :company_id, presence: true
end
