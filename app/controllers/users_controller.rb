class UsersController < ApplicationController

  # def index
  #   @articles = Article.all.order('created_at DESC')
  # end
  def show
    @articles = Article.where(user_id: current_user.id)
  end
end
