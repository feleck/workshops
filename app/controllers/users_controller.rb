class UsersController < ApplicationController
  before_action :authenticate_user!

  expose(:user)

  def show
  end
end
