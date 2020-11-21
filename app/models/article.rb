class Article < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :output
  end
end
