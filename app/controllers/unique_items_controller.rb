class UniqueItemsController < ApplicationController
  layout 'famiapp'

  # GET /unique_items
  # GET /unique_items.json
  def index
    @unique_items = UniqueItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @unique_items }
    end
  end

  # GET /unique_items/1
  # GET /unique_items/1.json
  def show
    @unique_item = UniqueItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @unique_item }
    end
  end

  # GET /unique_items/new
  # GET /unique_items/new.json
  def new
    @unique_item = UniqueItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @unique_item }
    end
  end

  # GET /unique_items/1/edit
  def edit
    @unique_item = UniqueItem.find(params[:id])
  end

  # POST /unique_items
  # POST /unique_items.json
  def create
    @unique_item = UniqueItem.new(params[:unique_item])

    respond_to do |format|
      if @unique_item.save
        format.html { redirect_to @unique_item, notice: 'Unique item was successfully created.' }
        format.json { render json: @unique_item, status: :created, location: @unique_item }
      else
        format.html { render action: "new" }
        format.json { render json: @unique_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /unique_items/1
  # PUT /unique_items/1.json
  def update
    @unique_item = UniqueItem.find(params[:id])

    respond_to do |format|
      if @unique_item.update_attributes(params[:unique_item])
        format.html { redirect_to @unique_item, notice: 'Unique item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @unique_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unique_items/1
  # DELETE /unique_items/1.json
  def destroy
    @unique_item = UniqueItem.find(params[:id])
    @unique_item.destroy

    respond_to do |format|
      format.html { redirect_to unique_items_url }
      format.json { head :no_content }
    end
  end
end