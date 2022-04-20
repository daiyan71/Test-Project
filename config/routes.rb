Rails.application.routes.draw do
  resources :courses
  resources :semesters
  get 'admin', to: "admin_home#home"
  get 'specificCourses/:id', to: "courses#indexSpecific" ,  as: "specific_course"
  get 'newSpecificCourse/:id', to: "courses#newSpecific" ,  as: "new_specific_course"
  devise_for :students
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "student_home#home"
end
