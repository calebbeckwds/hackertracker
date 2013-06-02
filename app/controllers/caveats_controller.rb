class CaveatsController < ApplicationController
  layout 'famiapp'

  # GET /caveats
  # GET /caveats.json
  def index
    @caveats = Caveat.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @caveats }
    end
  end

  # GET /caveats/1
  # GET /caveats/1.json
  def show
    @caveat = Caveat.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @caveat }
    end
  end

  # GET /caveats/new
  # GET /caveats/new.json
  def new
    @caveat = Caveat.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @caveat }
    end
  end

  # GET /caveats/1/edit
  def edit
    @caveat = Caveat.find(params[:id])
  end

  # POST /caveats
  # POST /caveats.json
  def create
    @caveat = Caveat.new(params[:caveat])

    respond_to do |format|
      if @caveat.save
        format.html { redirect_to @caveat, notice: 'Caveat was successfully created.' }
        format.json { render json: @caveat, status: :created, location: @caveat }
      else
        format.html { render action: "new" }
        format.json { render json: @caveat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /caveats/1
  # PUT /caveats/1.json
  def update
    @caveat = Caveat.find(params[:id])

    respond_to do |format|
      if @caveat.update_attributes(params[:caveat])
        format.html { redirect_to @caveat, notice: 'Caveat was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @caveat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /caveats/1
  # DELETE /caveats/1.json
  def destroy
    @caveat = Caveat.find(params[:id])
    @caveat.destroy

    respond_to do |format|
      format.html { redirect_to caveats_url }
      format.json { head :no_content }
    end
  end
end
