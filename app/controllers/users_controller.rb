class UsersController < ApplicationController
  respond_to :json
  before_filter :authorize, only: [:update, :destroy]
  before_action :set_user, only: [:update, :destroy]

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id #log the user in
      render json: {user_id: @user.id, message: 'User was successfully created', status: :success}
    else
      render json: {errors: @user.errors, message: 'User was not created', status: :unprocessable_entity }
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @user.update(user_params)
      render json: {message: 'User was successfully updated', status: :success}
    else
      render json: {message: 'User was not updated', errors: @user.errors, status: :unprocessable_entity }
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    render json: { message: 'User was successfully destroyed', status: :success }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :date_of_birth, :gender_id, :phone_number)
    end
end
