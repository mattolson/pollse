class PollsController < ApplicationController
  before_filter :authenticate_user!, :only => [:activate, :deactivate]

  def index
    @polls = Poll.active
  end

  def show
    @poll = Poll.find(params[:id])
    @response = @poll.responses.build
  end

  # Return the next featured poll that the user hasn't already answered
  def next
    @poll = Poll.where(:featured => true).order('created_at desc').select do |poll|
      !current_or_guest_user.answered?(poll)
    end.compact.first
    if @poll
      @response = @poll.responses.build
    end
  end

  def new
    @poll = current_or_guest_user.polls.build
    @poll.build_question
  end

  def create
    @poll = current_or_guest_user.polls.build(params[:poll])
    if @poll.save
      @poll.activate! if user_signed_in?
      redirect_to @poll, notice: 'Poll was successfully created.'
    else
      render action: "new"
    end
  end

  # TODO: what if user already deactivated this poll? Should we allow
  # activation again?
  def activate
    @poll = current_user.polls.find(params[:id])
    @poll.activate!
    redirect_to @poll, notice: 'OK, your poll has been activated!'
  end

  def deactivate
    @poll = current_user.polls.find(params[:id])
    @poll.update_attribute(:enabled, false)
    redirect_to @poll, notice: 'OK, your poll has been deactivated!'
  end
end
