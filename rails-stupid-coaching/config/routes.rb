Rails.application.routes.draw do
  # --path  ----- controller / method
  get 'ask', to: 'questions#ask', as: :ask
  get 'answer', to: 'questions#answer', as: :answer
end

# localhost:3000/ask?
# MEANING
# --------------/controller's method
# ----------------------------------?params[:question] =

# localhost:3000/answer?question=hello
# MEANING
# --------------/controller's method
# ----------------------------------?params[:question] = "anything you write here"

# result
# localhost:3000/restaurants?food_type=indian
