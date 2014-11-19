class LessonsController < ApplicationController
  before_action :signed_in_user
  
  def index
    @lessons = Lesson.all
  end
  
  def new
    @lesson = Lesson.new(category_id: params[:category_id],
      user_id: current_user.id, name: Faker::Lorem.sentence)
    @words = @lesson.category.words.order("RAND()").limit 20
    @words.each do |word|
      @lesson.lesson_words.build word_id: word.id, word_answer_id: nil
    end
    if @lesson.save
      redirect_to edit_lesson_path @lesson
    else
      redirect_to @lesson.category
    end
  end

  def show
    @lesson = Lesson.find params[:id]
    @num_leanred = LessonWord.num_learned_by_lesson(@lesson).count
  end
  
  def edit
    @lesson = Lesson.find params[:id]
  end
  
  def update
    @lesson = Lesson.find params[:id]
    if @lesson.update_attributes lesson_params
      redirect_to @lesson
    else
      flash[:error] = "Lesson was not success full update"
      render "show"
    end
  end
  
  private 
    def lesson_params
      params.require(:lesson).permit :id, lesson_words_attributes: [:id, :word_answer_id]
    end
end
