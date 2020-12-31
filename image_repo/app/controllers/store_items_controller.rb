class StoreItemsController < ApplicationController
  before_action :set_store_item, only: [:show, :edit, :update, :destroy]

  # GET /store_items
  # GET /store_items.json
  def index
    @store_items = StoreItem.all
  end

  # GET /store_items/1
  # GET /store_items/1.json
  def show
  end

  # GET /store_items/new
  def new
    @store_item = StoreItem.new
  end

  # GET /store_items/1/edit
  def edit
  end

  # POST /store_items
  # POST /store_items.json
  def create
    puts "#################### STORE ITEM ##########################"
    puts store_item_params_for_new_item.inspect
    image_upload = store_item_params_for_new_item[:imageupload]
    item_hash = {price: store_item_params_for_new_item[:price], quantity: store_item_params_for_new_item[:quantity], imageurl: image_upload.original_filename }

    @store_item = StoreItem.new(item_hash)

    respond_to do |format|
      if @store_item.save
        File.open(Rails.root.join('app', 'assets', 'images', 'store_images', image_upload.original_filename), 'wb') do |file|
          file.write(image_upload.read)
        end
        format.html { redirect_to store_items_path, notice: 'Store item was successfully created.' }
        format.json { render :show, status: :created, location: @store_item }
      else
        format.html { render :new }
        format.json { render json: @store_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /store_items/1
  # PATCH/PUT /store_items/1.json
  def update
    respond_to do |format|
      if @store_item.update(store_item_params)
        format.html { redirect_to @store_item, notice: 'Store item was successfully updated.' }
        format.json { render :show, status: :ok, location: @store_item }
      else
        format.html { render :edit }
        format.json { render json: @store_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /store_items/1
  # DELETE /store_items/1.json
  def destroy
    @store_item.destroy
    respond_to do |format|
      format.html { redirect_to store_items_url, notice: 'Store item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def buy
    puts "************** BUY *************"
    @store_item = StoreItem.find(params[:id])
    @user = User.find(current_user.id)
    @user_account = UserAccount.find_by_user_id(current_user.id)
    
    user_account_wallet = @user_account[:wallet]
    store_item_quantity = @store_item[:quantity]
    store_item_price = @store_item[:price]
  
    if user_account_wallet < store_item_price 
      redirect_to store_items_url, notice: 'Insufficient Funds!'
      return
    end

    if store_item_quantity == 0
      redirect_to store_items_url, notice: 'Item Out of Stock!'
      return
    end

    if UserItem.exists?(user_id: current_user.id, store_item_id: @store_item[:id]) 
      @user_item = UserItem.find_by(user_id: current_user.id, store_item_id: @store_item[:id])
      user_item_quantity = @user_item[:quantity]
      user_item_quantity += 1
      @user_item.update(quantity: user_item_quantity)
    else
      user_item_hash = {user_id: current_user.id, store_item_id: @store_item[:id], quantity: 1}
      @user_item = UserItem.new(user_item_hash)
      @user_item.save 
    end

    user_account_wallet -= store_item_price
    @user_account.update(wallet: user_account_wallet)

    store_item_quantity -= 1
    @store_item.update(quantity: store_item_quantity)

    redirect_to store_items_url, notice: 'Thanks For Your Ghrapp'

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store_item
      @store_item = StoreItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def store_item_params
      params.require(:store_item).permit(:price, :quantity)
    end

    def store_item_params_for_new_item
      params.require(:store_item).permit(:price, :quantity, :imageupload)
    end
end
