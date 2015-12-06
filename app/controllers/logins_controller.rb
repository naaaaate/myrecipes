class LoginsController < ApplicationController

  def new

  end

  def create
    # 1.  first find chef by email
    chef = Chef.find_by(email: params[:email])
    # 2.  then see if chef exists and the PW is correct
    if chef && chef.authenticate(params[:password])
      # 3.  then store that chef's id in the session cookie object hash
      session[:chef_id] = chef.id

      flash[:success] = "You are logged in"
      redirect_to recipes_path
    else
      flash.now[:danger] = "Your email address or password does not match"
      render 'new'
    end
  end

  def destroy
    session[:chef_id] = nil
    flash[:success] = "You have been logged out"
    redirect_to root_path
  end


end