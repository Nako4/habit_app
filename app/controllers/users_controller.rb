class UsersController < ApplicationController
  def show
    # @articles = Article.where(user_id: current_user.id).order('created_at DESC')
    # @habits = Article.where(user_id: current_user.id).order('created_at DESC')
    @habits = Habit.where(@user_id == current_user.id).order('created_at DESC')
  end

  def checked
    action = Habit.find(params[:id])
    if action.checked
      action.update(checked: false)
    else
      action.update(checked: true)
    end

    item = Habit.find(params[:id])
    render json: { action: item }
  end

end
