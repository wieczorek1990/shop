class OrdersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])
    @order_positions = @order.order_positions

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @order = Order.new
    @order_positions = current_user.basket.order_positions
    @addresses = Address.where(:user_id => current_user.id)
    @order.value = sum_price(@order_positions)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(params[:order])
    @addresses = Address.where(:user_id => current_user.id)
    @order.status = 0;
    @order.delivery_cost = @order.delivery.cost
    @order.user = current_user
    @order_positions = current_user.basket.order_positions
    @order.order_positions = @order_positions
    @order.value = sum_price(@order_positions)

    respond_to do |format|
      if @order.save
        @order_positions.each do |op|
          op.container = @order
          op.save
          p = op.product
          p.availability -= op.amount
          p.save
        end
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  def sum_price(order_positions)
    value = 0
    order_positions.each { |op| value += op.price }
    return value
  end
end
