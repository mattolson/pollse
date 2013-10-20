class StaticPagesController < ApplicationController

  def index
    @featured_poll = Poll.where(:featured => true).order('created_at desc').select do |poll|
      current_or_guest_user != poll.user && !current_or_guest_user.answered?(poll)
    end.compact.first
    if @featured_poll
      @response = @featured_poll.responses.build
    end
    render layout: "home"
  end

  def about
  end

  def privacy
  end

end
