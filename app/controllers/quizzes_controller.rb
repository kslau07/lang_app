class QuizzesController < ApplicationController
  def index; end

  def show
    @quiz = Quiz.includes(:answered_questions).find(params[:id])
    question_ids = @quiz.answered_questions.pluck(:question_id)
    @questions = Question.where(id: question_ids)
    # @questions = Question.where(id: question_ids).pluck(:id, :body, :correct_answer)
  end

  def new
    flash.now[:alert] = 'Sign up or log in to save your quizzes!'
    @user_id = current_user ? current_user.id : User.find_by('email = ?', 'guest').id

    @quiz = Quiz.new
    @questions = random_questions

    2.times { @quiz.answered_questions.build }
  end

  def create
    @quiz = Quiz.new(quiz_params)

    if @quiz.save
      redirect_to quiz_path(@quiz), notice: 'You have successfully completed a quiz!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update; end

  def destroy; end

  private

  def random_questions
    Question.where(id: [1, 3])
  end

  def quiz_params
    params.require(:quiz).permit(:user_id,
                                 answered_questions_attributes: %i[id question_id answer])
  end
end
