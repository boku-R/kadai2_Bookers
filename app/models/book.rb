class Book < ApplicationRecord

  # バリデーションの記述
  validates :title,presence: true
  validates :body,presence: true
end
