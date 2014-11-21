class StaticPagesController < ApplicationController
  
  def index
    
  end
  
  def home
    @user = current_user
    @activities = @user.activities.order("DATE(created_at) DESC").limit 20
  end
   
  def about
  end

  def contact
  end
end