class StaticPagesController < ApplicationController
  def home
  	#if signed_in?
  		#redirect_to current_user
  	#end
    @micropost = current_user.microposts.build if signed_in?
  end

  def help
  end

  def about
  end

  def contact
  end
end
