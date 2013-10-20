class StaticPagesController < ApplicationController

  def index
    @featured_poll = Poll.where(:featured => true).first
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
