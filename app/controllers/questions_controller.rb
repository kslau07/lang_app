# Create @user_id that can be used anywhere on the app. Do not send user ids with html.

class QuestionsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def new
    @question = Question.new
    @category = @question.build_category
    @categories = Category.all
  end

  def create
    # Get rid of extra param inside nested param [:category_attributes][:new_category_name]
    clean_params = question_params.except(:category_attributes)
    # We do not have to add the nested hash back in, but normally it exists
    clean_params[:category_attributes] = question_params[:category_attributes].except(:new_category_name)
    @question = Question.new(clean_params)

    category = Category.find_or_create_by(name: question_params[:category_attributes][:name])
    category.user_id = current_user.id if category.id.nil?
    @question.category = category

    

    if @question.save
      redirect_to categories_path, notice: 'Your question was saved!'
    else
      flash.now[:notice] = 'Some items require your attention.'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def question_params
    # If exists, pull out new category name from nested hash and set it
    if params[:question][:category_attributes][:name] == 'add_category'
      params[:question][:category_attributes][:name] =
        params[:question][:category_attributes][:new_category_name]
    end

    params[:question][:user_id] = current_user.id

    params.require(:question).permit(:ques_content, :correct_answer, :user_id,
                                     category_attributes: %i[id name new_category_name])
                                    #  category_attributes: %i[id name user_id new_category_name])
  end

  def require_login
    unless current_user
      redirect_to new_user_session_path, { flash: { alert: 'You must be logged in to submit questions.' } }
    end
  end

  # def set_user_id
  #   @guest_or_user = current_user ? current_user.id : User.find_by(email: 'guest')
  # end
end
