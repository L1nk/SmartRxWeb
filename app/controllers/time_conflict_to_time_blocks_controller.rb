class TimeConflictToTimeBlocksController < ApplicationController
  # GET /time_conflict_to_time_blocks
  # GET /time_conflict_to_time_blocks.json
  def index
    @time_conflict_to_time_blocks = TimeConflictToTimeBlock.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @time_conflict_to_time_blocks }
    end
  end

  # GET /time_conflict_to_time_blocks/1
  # GET /time_conflict_to_time_blocks/1.json
  def show
    @time_conflict_to_time_block = TimeConflictToTimeBlock.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @time_conflict_to_time_block }
    end
  end

  # GET /time_conflict_to_time_blocks/new
  # GET /time_conflict_to_time_blocks/new.json
  def new
    @time_conflict_to_time_block = TimeConflictToTimeBlock.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @time_conflict_to_time_block }
    end
  end

  # GET /time_conflict_to_time_blocks/1/edit
  def edit
    @time_conflict_to_time_block = TimeConflictToTimeBlock.find(params[:id])
  end

  # POST /time_conflict_to_time_blocks
  # POST /time_conflict_to_time_blocks.json
  def create
    @time_conflict_to_time_block = TimeConflictToTimeBlock.new(params[:time_conflict_to_time_block])

    respond_to do |format|
      if @time_conflict_to_time_block.save
        format.html { redirect_to @time_conflict_to_time_block, notice: 'Time conflict to time block was successfully created.' }
        format.json { render json: @time_conflict_to_time_block, status: :created, location: @time_conflict_to_time_block }
      else
        format.html { render action: "new" }
        format.json { render json: @time_conflict_to_time_block.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /time_conflict_to_time_blocks/1
  # PUT /time_conflict_to_time_blocks/1.json
  def update
    @time_conflict_to_time_block = TimeConflictToTimeBlock.find(params[:id])

    respond_to do |format|
      if @time_conflict_to_time_block.update_attributes(params[:time_conflict_to_time_block])
        format.html { redirect_to @time_conflict_to_time_block, notice: 'Time conflict to time block was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @time_conflict_to_time_block.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_conflict_to_time_blocks/1
  # DELETE /time_conflict_to_time_blocks/1.json
  def destroy
    @time_conflict_to_time_block = TimeConflictToTimeBlock.find(params[:id])
    @time_conflict_to_time_block.destroy

    respond_to do |format|
      format.html { redirect_to time_conflict_to_time_blocks_url }
      format.json { head :no_content }
    end
  end
end
