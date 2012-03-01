class RegistrationsController < Devise::RegistrationsController
  
  def new
    super
  end
  
  def create
    @user = User.new(params[:user])
    
    @user.schedule = Schedule.new(:schedule_name => 'My Schedule')
    
    respond_to do |format|
      if @user.save
        format.html { redirect_to '', notice: 'Account was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
end
