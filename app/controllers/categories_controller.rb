class CategoriesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :create]
  before_action :authenticate_admin!, only: [:new, :edit, :update, :create]
  expose(:categories)
  expose(:category)
  expose(:product) { Product.new }

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    self.category = Category.new(category_params)

    if category.save
      redirect_to category, notice: 'Category was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if category.update(category_params)
      redirect_to category, notice: 'Category was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    category.destroy
    redirect_to categories_url, notice: 'Category was successfully destroyed.'
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end

    def authenticate_admin!
      if !user_signed_in?
        redirect_to new_user_session_path
      elsif !current_user.admin?
        redirect_to new_user_session_path, alert: 'Only admin can do this!'
        # if user signed_in it is further redirected to categories#index page with notice "Already sigend in"
      end
    end
end
