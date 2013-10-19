class PollsController < ApplicationController
  
  def index
    @polls = Poll.active
  end

  def show
    @poll = Poll.find(params[:id])
  end

  def new
    @poll = current_or_guest_user.polls.build
  end

  def edit
    @poll = current_or_guest_user.polls.find(params[:id])
  end

  # TODO: Only logged in users can create!
  def create
    @poll = current_or_guest_user.polls.build(params[:poll])
    
    if @poll.save
      redirect_to @poll, notice: 'Poll was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @poll = current_or_guest_user.polls.find(params[:id])
    
    if @poll.update_attributes(params[:poll])
      redirect_to @poll, notice: 'Poll was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @poll = current_or_guest_user.polls.find(params[:id])
    @poll.destroy

    redirect_to polls_url
  end
end
