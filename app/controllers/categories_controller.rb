class CategoriesController < ApplicationController

  # Have page "pause" after submitting a question so user can see green check mark indicating success
  
  def index
    @categories = Category.all
    @questions = Question.all
    @category = Category.new
    1.times { @category.questions.build }        # How can we add more on the fly? -> Turbo
  end
  
  def new
    @category = Category.new
  end
  
  def create
    @categories = Category.all
    @questions = Question.all
    @category = Category.find_or_create_by(name: category_params[:name])
    @category.attributes = category_params


    # 1.times { @category.questions.build }        # How can we add more on the fly?
    # @question_options = Category.all.map{ |s| [ s.name, s.id ]}


    if @category.save
      redirect_to categories_path, notice: 'Your category was saved!'
    else
      flash.now[:notice] = "Some items require your attention."
      render :index, status: :unprocessable_entity
    end
  end
  
  def edit
    
  end
  
  def update
    
  end
  
  def show
    
  end
  
  def destroy
    
  end

  private

  def category_params
    params[:category][:name] = params[:category][:new_category_name] if params[:category][:name] == 'add_category'

    params.require(:category)
          .permit(:name, :user_id,
                  questions_attributes: [:id, :body, :correct_answer, :user_id] )
  end
end




# Sessions & Cookies
# https://www.justinweiss.com/articles/how-rails-sessions-work/
# https://www.akshaykhot.com/rails-sessions/
# https://dev.to/ayushn21/demystifying-cookie-security-in-rails-6-1j2f
# Sessions are avail. to the C and V ONLY
# Access session like this: session[:current_user_id]

# cookies[:welcome_message_shown] = 'true' # Plain text cookie
# session[:current_user_id] = 42
# cookies.signed[:foo] = "bar"
# cookies.signed[:hello] = "world"
# cookies.encrypted[:remember_token] = "token"
