class QuestionsController < ApplicationController
  def new
    
  end

  def create
    # @question = Question.new(question_params)

    # if @question.save
    #   redirect_to categories_path, notice: 'Your question was saved!'
    # else
    #   flash.now[:notice] = "Some items require your attention." 
    #   render 'categories/index', status: :unprocessable_entity
    # end
  end

  private

  # def question_params
  #   params.require(:question).permit(:body, :answer, :category_id)
  # end
end
