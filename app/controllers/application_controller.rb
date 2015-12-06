class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

# helper methods are available to the views when u specify them..
  helper_method :current_user, :logged_in?


  def current_user
    # find the current user by finding the chef whos id is stored in the session object..
    # memoization - store in instance var so it doesnt hit db on every request
    @current_user ||= Chef.find(session[:chef_id]) if session[:chef_id]
  end

  def logged_in?
    # !! will return a boolean true or false
    !!current_user
      # this tells u if user is logged in or not.
  end


  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to complete the action"
      redirect_to :back
    end
  end

end
