class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @featured_poll = @user.polls.active.includes(:question => :question_options).where(:vanity => true).first
    if @featured_poll
      @response = @featured_poll.responses.build
    end
  end
end
