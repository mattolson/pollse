class ResponsesController < ApplicationController
  # POST /responses
  # POST /responses.json
  def create
    @response = Response.new(params[:response])
    @response.poll_id = params[:poll_id]
    @response.user = current_or_guest_user

    respond_to do |format|
      @response.save
      format.js
    end
  end
end
