class OrderPositionsController < ApplicationController
  # GET /order_positions
  # GET /order_positions.json
  def index
    @order_positions = OrderPosition.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @order_positions }
    end
  end

  # GET /order_positions/1
  # GET /order_positions/1.json
  def show
    @order_position = OrderPosition.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order_position }
    end
  end

  # GET /order_positions/new
  # GET /order_positions/new.json
  def new
    @order_position = OrderPosition.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order_position }
    end
  end

  # GET /order_positions/1/edit
  def edit
    @order_position = OrderPosition.find(params[:id])
  end

  # POST /order_positions
  # POST /order_positions.json
  def create
    @order_position = OrderPosition.new(params[:order_position])

    respond_to do |format|
      if @order_position.save
        format.html { redirect_to @order_position, notice: 'Order position was successfully created.' }
        format.json { render json: @order_position, status: :created, location: @order_position }
      else
        format.html { render action: "new" }
        format.json { render json: @order_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /order_positions/1
  # PUT /order_positions/1.json
  def update
    @order_position = OrderPosition.find(params[:id])

    respond_to do |format|
      if @order_position.update_attributes(params[:order_position])
        format.html { redirect_to @order_position, notice: 'Order position was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_positions/1
  # DELETE /order_positions/1.json
  def destroy
    @order_position = OrderPosition.find(params[:id])
    @order_position.destroy

    respond_to do |format|
      format.html { redirect_to order_positions_url }
      format.json { head :no_content }
    end
  end
end
