class LessonWord < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :word
  belongs_to :word_answer

  scope :num_learned_by_lesson, ->(lesson) {
    where("lesson_id = ? AND word_answer_id IS NOT NULL", lesson.id)
  }

  def word_content
    if self.word_answer_id.nil?
      "You have not learned this word"
    else
      self.word_answer.content
    end
  end
 
  def checked?
    if (!self.word_answer_id.nil? and self.word_answer.correct == true)
      true
    else
      false
    end
  end
end
