class QuestionsController < ApplicationController
  ANSWERS = {
    1 => { sentence: 'Silly question, get dressed and go to work!' },
    2 => { sentence: "I don't care, get dressed and go to work!" }
  }
  def ask
  end

  def answer
    magic = 'I am going to work right now!'
    # it's like gets.chomp from 3 destination: url, body input, id
    @question = params[:question]
    if params[:question].split('')[-1] == '?'
      @answers = ANSWERS[1][:sentence]
    elsif params[:question] != magic
      @answers = ANSWERS[2][:sentence]
    elsif params[:question] == magic
      @answers = ''
    end
  end
end
# localhost:3000/answer?question=hello
# localhost:3000/restaurants?food_type=indian
# params[:food_type]
