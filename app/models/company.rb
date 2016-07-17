class Company < ApplicationRecord
  has_many :jobs

  def premium?
    jobs.count >= 5 ? true : false
  end
end
