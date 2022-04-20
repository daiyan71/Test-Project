Rails.application.routes.draw do
  resources :semesters
  get 'admin', to: "admin_home#home"
  devise_for :students
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "student_home#home"
end
