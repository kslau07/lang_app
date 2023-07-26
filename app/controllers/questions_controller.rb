class QuestionsController < ApplicationController
  def new
    @question = Question.new
    @category = @question.build_category
  end

  def create
    
    # qu=Question.new(question_params)
    # qu.errors.full_messages
    # cat=qu.build_category

    @question = Question.new(question_params)
    # @question.build_category.attributes={}
    
    category = Category.find_or_create_by(name: question_params[:category_attributes][:name])
    category.user_id = question_params[:category_attributes][:user_id] if category.id.nil?
    @question.category=category

    debugger
    # question_params[:category_attributes][:name]

    # category.attributes = category_params

    # @question.category = category

    # if @question.save
    #   redirect_to categories_path, notice: 'Your question was saved!'
    # else
    #   flash.now[:notice] = "Some items require your attention." 
    #   render 'categories/index', status: :unprocessable_entity
    # end
  end

  private

  def question_params
    # params.require(:question).permit(:body, :correct_answer, :category_id)
    params.require(:question).permit(:body, :correct_answer, :user_id,
                                    category_attributes: [:id, :name, :user_id])
  end


  # def category_params
  #   params[:category][:name] = params[:category][:new_category_name] if params[:category][:name] == 'add_category'

  #   params.require(:category)
  #         .permit(:name, :user_id,
  #                 questions_attributes: [:id, :body, :correct_answer, :user_id] )
  # end

end
