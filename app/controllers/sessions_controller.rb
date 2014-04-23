class SessionsController < ApplicationController
  respond_to :json

  def create
    user = User.find_by_email(params[:email])
    
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: {user_id: user.id, message: "You are logged in", status: :success}
    else
      render json: {message: "Email or password is invalid", status: :unprocessable_entity}
    end
  end

  def destroy
    session[:user_id] = nil
    render json: {message: "You are logged out", status: :success}
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_session
      @session = Session.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def session_params
      params[:session]
    end
end
