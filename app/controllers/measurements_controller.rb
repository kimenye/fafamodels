class MeasurementsController < ApplicationController
  respond_to :json
  

  # PATCH/PUT /measurements/1
  # PATCH/PUT /measurements/1.json
  def update
    @user = User.find_by(id: params[:id])
    @measurement = @user.measurement
    
    if @measurement.update(measurement_params)
      render json: {user_id: @user.id, message: 'Measurements were successfully updated', status: :success}
    else
      render json: {message: 'Measurements were not updated', errors: @measurement.errors, status: :unprocessable_entity }
    end
  end


  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def measurement_params
      params.require(:measurement).permit(:user_id,:height,:eye_colour,:hair_colour,:skin_colour,:shoe_size,:neck,:suit_size,:shoulders,:shirt_size,:inside_leg_size,:bust,:bra_size,:waist,:hips,:dress_size,:clothing_size_age)
    end
end
