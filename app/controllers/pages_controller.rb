class PagesController < ApplicationController

  def home
    redirect_to chatrooms_path if logged_in?
  end

end
