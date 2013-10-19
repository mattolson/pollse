class PointTransactionsController < ApplicationController
  # GET /point_transactions
  # GET /point_transactions.json
  def index
    @point_transactions = PointTransaction.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @point_transactions }
    end
  end

  # GET /point_transactions/1
  # GET /point_transactions/1.json
  def show
    @point_transaction = PointTransaction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @point_transaction }
    end
  end

  # GET /point_transactions/new
  # GET /point_transactions/new.json
  def new
    @point_transaction = PointTransaction.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @point_transaction }
    end
  end

  # GET /point_transactions/1/edit
  def edit
    @point_transaction = PointTransaction.find(params[:id])
  end

  # POST /point_transactions
  # POST /point_transactions.json
  def create
    @point_transaction = PointTransaction.new(params[:point_transaction])

    respond_to do |format|
      if @point_transaction.save
        format.html { redirect_to @point_transaction, notice: 'Point transaction was successfully created.' }
        format.json { render json: @point_transaction, status: :created, location: @point_transaction }
      else
        format.html { render action: "new" }
        format.json { render json: @point_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /point_transactions/1
  # PUT /point_transactions/1.json
  def update
    @point_transaction = PointTransaction.find(params[:id])

    respond_to do |format|
      if @point_transaction.update_attributes(params[:point_transaction])
        format.html { redirect_to @point_transaction, notice: 'Point transaction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @point_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /point_transactions/1
  # DELETE /point_transactions/1.json
  def destroy
    @point_transaction = PointTransaction.find(params[:id])
    @point_transaction.destroy

    respond_to do |format|
      format.html { redirect_to point_transactions_url }
      format.json { head :no_content }
    end
  end
end
