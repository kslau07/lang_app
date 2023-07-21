class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @questions = Question.all
    @category = Category.new
    1.times { @category.questions.build }        # How can we add more on the fly? -> Turbo


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
    # decrypt_cookie
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

    params.require(:category).permit(:name,
                                     questions_attributes: [:id, :body, :answer] )
  end

  def decode_cookie
    require 'uri'
    # cookies.signed[:user_id] = "42"
    cookie = "eyJfcmFpbHMiOnsibWVzc2FnZSI6IklqUXlJZz09IiwiZXhwIjpudWxsLCJwdXIiOiJjb29raWUudXNlcl9pZCJ9fQ%3D%3D--94afbf4575daf37313f40d6342a994a5e1719d79"
    cookie_value = cookie.split("--").first
    cookie_value = URI.decode_www_form_component(cookie_value)
    # cookie_value = URI.unescape(cookie_value)
    cookie_payload = JSON.parse Base64.decode64(cookie_value)

    decoded_stored_value = Base64.decode64 cookie_payload["_rails"]["message"]
    stored_value = JSON.parse decoded_stored_value

    # debugger                # delete me
  end

  def decrypt_cookie(cookie = nil)

    # session
    # cookie = 'f8tmKyPaujdmk2wY6xA6UNUX3%2FkAL7F44pTUIGcButytjohVyrHXDxkICg0F%2BAZaMo5TQH66QvVsDRCPghDHNiO9Z%2FFBHCQ4w0WckCNHG8XjJAksb0ggfnqkOyVHS%2ByTpFCsbls5NPdMlWw3LhDHzQP17nMCEYWYn91PJQn8uVlc%2B0%2FqxASZl6t4eF0g1sD2eCjdaKOgDv%2Bj81u5sBo5qpVbFCr827a9XLLZRdXdLD56OHsrxhpuymNpWEmVXpES0C7Ge5%2FhfShepwA9IjPzRvN89mVMYLbQX9%2FMEzUS8YJ75waHE3zMtkmFawgP9zxOfUIuyE8%3D--JBqmUamd%2BsdJUPVc--8lcXQmYSwuH99jI4SA%2FliQ%3D%3D'

    # encrypted cookie
    cookie = 'Q7lNJcyEuefjH5G%2BcBNyrwmvFCGL1Nt66JJIyMrF%2FY55%2F3V6XWbGVsVqzO4isYnofUqzX%2Fm%2F6X52EIQzE99sW59OmI5NKjcyFPEKsSHa--rZs7jbF5LEQRguI8--mOdLffXwHAnry4Y8sSMETw%3D%3D'
  
    cookie = CGI.unescape(cookie)
    data, iv, auth_tag = cookie.split("--").map do |v| 
      Base64.strict_decode64(v)
    end
    cipher = OpenSSL::Cipher.new("aes-256-gcm")

    # Compute the encryption key
    secret_key_base = Rails.application.secret_key_base
    secret = OpenSSL::PKCS5.pbkdf2_hmac(secret_key_base, "authenticated encrypted cookie", 1000, cipher.key_len, OpenSSL::Digest::SHA256.new)

    # Setup cipher for decryption and add inputs
    cipher.decrypt
    cipher.key = secret
    cipher.iv  = iv
    cipher.auth_tag = auth_tag
    cipher.auth_data = ""

    # Perform decryption
    cookie_payload = cipher.update(data)
    cookie_payload << cipher.final
    cookie_payload = JSON.parse(cookie_payload)

    # Decode Base64 encoded stored data
    decoded_stored_value = Base64.decode64(cookie_payload["_rails"]["message"])
    stored_value = JSON.parse(decoded_stored_value)
  end
end
