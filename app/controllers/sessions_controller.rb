class SessionsController < ApplicationController
  def new
  end

  def create
    @admin = Admin.find_by(email: params[:email])
    if @admin.try(:authenticate, params[:password])
      session[:admin] = @admin.id
      redirect_to admin_home_url(@admin)
    else
      redirect_to login_url, alert: "Invalid user/password combination"
    end
  end

  def destroy
    session[:admin] = nil
    redirect_to login_url, notice: "Logged out"
  end
end
