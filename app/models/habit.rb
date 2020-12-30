class Habit < ApplicationRecord
  belongs_to :user
  has_many :articles
  def start_time
    date
  end

  with_options presence: true do
    validates :date, format: { with: /\d\d\d\d-\d\d-\d\d/.freeze }
    validates :achieve
  end
end