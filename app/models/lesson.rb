class Lesson < ActiveRecord::Base
  after_save :create_activity
  
  belongs_to :user
  belongs_to :category
  has_many :lesson_words
  has_one :activity
  accepts_nested_attributes_for :lesson_words
  
  def create_activity
    Activity.create!(user_id: self.user_id, lesson_id: self.id)
  end
end
