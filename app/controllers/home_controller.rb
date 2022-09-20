class HomeController < ApplicationController
  def about
    if user_signed_in?
      @user = current_user
    else
      false
    end
  end 
end
