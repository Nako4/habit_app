class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show, :edit, :update, :destroy]

  def create
    @article = Article.where(user_id: current_user.id)
    @habit = Habit.create(habit_params)
    redirect_to users_show_path
  end

  def show
    @articles = Article.where(user_id: current_user.id).order('created_at DESC')
    @habits = Habit.where(user_id: current_user.id)
  end

  private

  def habit_params
    params.permit(:date, :achieve).merge(user_id: current_user.id)
  end
end
