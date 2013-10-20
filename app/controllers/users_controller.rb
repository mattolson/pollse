class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    if @user == current_user
      @polls = @user.polls
    else
      @polls = @user.polls.active
    end
  end
end
