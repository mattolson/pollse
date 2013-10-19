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

  # PUT /responses/1
  # PUT /responses/1.json
  def update
    @response = Response.find(params[:id])
    @response.poll_id = params[:poll_id]
    @response.user = current_or_guest_user

    respond_to do |format|
      @response.update_attributes(params[:response])
      format.js
    end
  end
end
