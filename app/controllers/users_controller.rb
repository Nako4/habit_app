class UsersController < ApplicationController

  def create
    @article = Article.where(user_id: current_user.id)
    @habit = Habit.new(habit_params)
    if @habit.valid?
      @habit.save
      return redirect_to users_show_path
    end
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
