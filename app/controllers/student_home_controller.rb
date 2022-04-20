class StudentHomeController < ApplicationController
    before_action :authenticate_student!
    def home 
    end
end
