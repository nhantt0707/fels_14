class Lesson < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :lesson_words
  accepts_nested_attributes_for :lesson_words
end
