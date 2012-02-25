class TimeBlocksController < ApplicationController
  # GET /time_blocks
  # GET /time_blocks.json
  def index
    @time_blocks = TimeBlock.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @time_blocks }
    end
  end

  # GET /time_blocks/1
  # GET /time_blocks/1.json
  def show
    @time_block = TimeBlock.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @time_block }
    end
  end

  # GET /time_blocks/new
  # GET /time_blocks/new.json
  def new
    @time_block = TimeBlock.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @time_block }
    end
  end

  # GET /time_blocks/1/edit
  def edit
    @time_block = TimeBlock.find(params[:id])
  end

  # POST /time_blocks
  # POST /time_blocks.json
  def create
    @time_block = TimeBlock.new(params[:time_block])

    respond_to do |format|
      if @time_block.save
        format.html { redirect_to @time_block, notice: 'Time block was successfully created.' }
        format.json { render json: @time_block, status: :created, location: @time_block }
      else
        format.html { render action: "new" }
        format.json { render json: @time_block.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /time_blocks/1
  # PUT /time_blocks/1.json
  def update
    @time_block = TimeBlock.find(params[:id])

    respond_to do |format|
      if @time_block.update_attributes(params[:time_block])
        format.html { redirect_to @time_block, notice: 'Time block was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @time_block.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_blocks/1
  # DELETE /time_blocks/1.json
  def destroy
    @time_block = TimeBlock.find(params[:id])
    @time_block.destroy

    respond_to do |format|
      format.html { redirect_to time_blocks_url }
      format.json { head :no_content }
    end
  end
end
