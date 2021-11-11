class UsersController < ApplicationController
  def index
    # render plain: 'Helle, World!'
    @num = 10 + 11
    @users = User.all
  end
end
