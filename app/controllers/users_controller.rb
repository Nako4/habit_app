class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show, :edit, :update, :destroy]

  def show
    @articles = Article.where(user_id: current_user.id).order('created_at DESC')
    @habits = Habit.where(user_id: current_user.id)
  end

  def create
    @article = Article.where(user_id: current_user.id)
    @habit = Habit.new(habit_params)
    habit = Habit.where(date: habit_params[:date], user_id: habit_params[:user_id])
    if (habit.present?)
      habit.update(habit_params)
    else
      @habit.save
    end
    redirect_to users_show_path
  end

  private

  def habit_params
    params.permit(:date, :achieve).merge(user_id: current_user.id)
  end
  
end
