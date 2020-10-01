class HostController < ApplicationController
  def login_form
  end

  def login
    @host= Host.find_by(login_id: params[:login_id])
    if @host
      session[:login_id] = @host.login_id
      flash[:notice] = "login success"
      redirect_to("/articles")
    else 
      @error_message = "IDまたはパスワードが違います"
      @login_id = params[:login_id]
      render("host/login_form")
    end
  end

  def logout
    session[:login_id] = nil
    flash[:notice] = "logout success"
    redirect_to("/login")
  end


end
