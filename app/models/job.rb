class Job < ApplicationRecord
  belongs_to :company
  belongs_to :category
  validates :title, :location, :category_id, :description, :company_id, presence: true
end
