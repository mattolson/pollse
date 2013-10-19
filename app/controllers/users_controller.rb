class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @featured_poll = @user.polls.active.where(:vanity => true).first
  end
end
