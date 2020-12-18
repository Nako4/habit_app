class Habit < ApplicationRecord
  belongs_to :user
  has_many :articles
  def start_time
    self.date
  end

  with_options presence: true do
    validates :date
    validates :achieve
  end

end
