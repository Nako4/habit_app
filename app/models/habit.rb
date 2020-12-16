class Habit < ApplicationRecord
  belongs_to :user
  has_many :articles
  def start_time
    self.date
  end
end
