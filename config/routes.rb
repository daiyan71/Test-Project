Rails.application.routes.draw do
  resources :enrollments
  resources :courses
  resources :semesters
  get 'admin', to: "admin_home#home"
  get 'specificCourses/:id', to: "courses#indexSpecific" ,  as: "specific_course"
  get 'newSpecificCourse/:id', to: "courses#newSpecific" ,  as: "new_specific_course"
  get 'selectCurrentSemester/:id', to: "admin_home#selectCurrentSemester" ,  as: "select_current_sem"
  get 'admin/students', to: "admin_home#allStudent" ,  as: "students"
  devise_for :students
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'see_courses', to: "student_home#seeCourses" ,  as: "see_courses"
  root to: "student_home#home"

end
