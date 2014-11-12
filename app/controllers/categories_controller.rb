class CategoriesController < ApplicationController
  before_action :signed_in_user
  
  def index
    @categories = Category.paginate page: params[:page], per_page: 5
  end
  
  def show
    @category = Category.find params[:id]
    @words = @category.words.paginate page: params[:page], per_page: 20
  end
end
