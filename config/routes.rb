Rails.application.routes.draw do
  devise_for :students
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "student_home#home"
end
