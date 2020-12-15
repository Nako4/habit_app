class UsersController < ApplicationController

  def new
    @articles = Article.where(user_id: current_user.id).order('created_at DESC')
    @habit = Article.new
  end

  def create
    # binding.pry
    @article = Article.where(user_id: current_user.id)
    @habit = Habit.new(habit_params)
    if @habit.valid?
      @habit.save
      return redirect_to users_show_path
    end
  end

  def show
    @articles = Article.where(user_id: current_user.id).order('created_at DESC') 
  end

  private

  def habit_params
    params.permit(:date, :achieve).merge(user_id: current_user.id)
  end
end
