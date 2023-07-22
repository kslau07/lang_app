class QuizzesController < ApplicationController
  def index
    
  end
  
  def show
    
  end
  
  def new
    @questions = random_questions
  end
  
  def create
    
  end
  
  def edit
    
  end
  
  def update
    
  end
  
  def destroy
    
  end

  private

  def random_questions
    arr = [1, 3]
    arr2 = []
    arr2 << Question.find(1).select(:id, :body, :correct_answer)
    arr2 << Question.find(2).select(:id, :body, :correct_answer)
    
  end
end
