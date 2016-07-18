class Company < ApplicationRecord
  has_many :jobs
  validates :name, :location, :mail, :phone, presence: true

  def premium?
    jobs.count >= 5 ? true : false
  end
end
