Rails.application.routes.draw do
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  resources :admins
  resources :enrollments
  resources :courses
  resources :semesters
  get 'admin', to: "admin_home#home" , as: "admin_home"
  get 'update_mark/:id', to: "admin_home#updateMark" , as: "update_mark"
  get 'publish_result', to: "admin_home#publishResult" , as: "publish_result"

  get 'specificCourses/:id', to: "courses#indexSpecific" ,  as: "specific_course"
  get 'newSpecificCourse/:id', to: "courses#newSpecific" ,  as: "new_specific_course"
  get 'selectCurrentSemester/:id', to: "admin_home#selectCurrentSemester" ,  as: "select_current_sem"
  get 'admin/students', to: "admin_home#allStudent" ,  as: "students"
  
  devise_for :students
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'see_courses', to: "student_home#seeCourses" ,  as: "see_courses"
  get 'see_enrolled', to: "student_home#seeEnrolledCourses", as: "see_enrolled_courses"
  root to: "student_home#home"

end
