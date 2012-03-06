class RegistrationsController < Devise::RegistrationsController
  
  def new
    super
  end
  
  def create
    @user = User.new(params[:user])
    
    schedule = @user.build_schedule(params[:schedule])
    
    respond_to do |format|
      if @user.save

        #send email to user informing him/her that the sign up was successful
        UserMailer.delay.welcome_email(@user)

        schedule.schedule_name = "My Schedule"

        if schedule.save
          @user.schedule_id = schedule.id
          @user.save
        end

        format.html { redirect_to '', notice: 'Account was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
end
