class PagesController < ApplicationController
  def home
    # if user is logged in.. dont show this home main page, just redirect to recipes index page..
    redirect_to recipes_path if logged_in?
  end

end