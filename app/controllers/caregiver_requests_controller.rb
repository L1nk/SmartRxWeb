class CaregiverRequestsController < ApplicationController
  # GET /caregiver_requests
  # GET /caregiver_requests.json
  def index
    @caregiver_requests = CaregiverRequest.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @caregiver_requests }
    end
  end

  # GET /caregiver_requests/1
  # GET /caregiver_requests/1.json
  def show
    @caregiver_request = CaregiverRequest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @caregiver_request }
    end
  end

  # GET /caregiver_requests/new
  # GET /caregiver_requests/new.json
  def new
    @caregiver_request = CaregiverRequest.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @caregiver_request }
    end
  end

  # GET /caregiver_requests/1/edit
  def edit
    @caregiver_request = CaregiverRequest.find(params[:id])
  end

  # POST /caregiver_requests
  # POST /caregiver_requests.json
  def create
    @caregiver_request = CaregiverRequest.new(params[:caregiver_request])

    @caregiver_request.caregiver_id = current_user.id
    
    respond_to do |format|
      if @caregiver_request.save
        format.html { redirect_to @caregiver_request, notice: 'Caregiver request was successfully created.' }
        format.json { render json: @caregiver_request, status: :created, location: @caregiver_request }
      else
        format.html { render action: "new" }
        format.json { render json: @caregiver_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /caregiver_requests/1
  # PUT /caregiver_requests/1.json
  def update
    @caregiver_request = CaregiverRequest.find(params[:id])

    respond_to do |format|
      if @caregiver_request.update_attributes(params[:caregiver_request])
        format.html { redirect_to @caregiver_request, notice: 'Caregiver request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @caregiver_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /caregiver_requests/1
  # DELETE /caregiver_requests/1.json
  def destroy
    @caregiver_request = CaregiverRequest.find(params[:id])
    @caregiver_request.destroy

    respond_to do |format|
      format.html { redirect_to caregiver_requests_url }
      format.json { head :no_content }
    end
  end

  # GET /caregiver_requests/manage
  # GET /caregiver_requests/manage.json
  def manage
    caregiver_requests = CaregiverRequest.all(:conditions => ["patient_email = ?", current_user.email])
    
    index = 0
    @requests = []
    for request in caregiver_requests
      @requests[index] = User.find(request.caregiver_id)
      index += 1
    end

    respond_to do |format|
      format.html # manage.html.erb
      format.json { render json: @caregiver_requests }
    end
  end

  def accept
    id = params[:id]
    
    caregiver = User.find(id)
    caregiver.is_caregiver = true
    current_user.has_caregiver = true
    current_user.caregiver_id = id

    CaregiverRequest.delete_all(:caregiver_id => id, :patient_email => current_user.email)
    
    respond_to do |format|
      if caregiver.save
        if current_user.save
          format.html { redirect_to '/manage_caregiver', notice: 'Caregiver request was accepted.' }
          format.json { head :no_content }
        end
      end
    end
  end

end
