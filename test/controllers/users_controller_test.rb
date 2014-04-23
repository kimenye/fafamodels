require "test_helper"

class UsersControllerTest < ActionController::TestCase
  before do
    @user = users(:one)
  end
  
  def test_create_user_correctly
    assert_difference('User.count') do
      post :create, user: { name: "name", email: "here@now.com", password: "password", date_of_birth: "2014-04-14", gender_id: genders(:male), phone_number: "1234567" }
    end
    
    assert JSON(response.body)['message'] == "User was successfully created", "created user does not pass correctly"
    assert JSON(response.body)['status'] == "success", "created user does not pass correct status"
    assert JSON(response.body)['user_id'] != nil, "user id not passed back"
  end
  
   def test_create_user_incorrectly
     assert_no_difference('User.count') do
       post :create, user: {email: "here@now.com", password: "password", date_of_birth: "2014-04-14", gender_id: genders(:male), phone_number: "1234567" }
     end
     
     assert JSON(response.body)['message'] == "User was not created", "created user does not fail correctly"
     assert JSON(response.body)['status'] == "unprocessable_entity", "created user does not pass correct status"
   end
   
   def test_authorization_fail
     put :update, id: @user, user: { name: "name2" }
     assert JSON(response.body)['message'] == "You must be signed in to access that page", "non-authorization failed"
   end
 
   def test_update_user
     log_in @user
     put :update, id: @user, user: { name: "name2" }
     
     assert JSON(response.body)['message'] == "User was successfully updated", "updated user does not pass correctly"
     assert JSON(response.body)['status'] == "success", "updated user does not pass correct status"
   end
 
   def test_destroy
     log_in @user
     assert_difference('User.count', -1) do
       delete :destroy, id: @user
     end
     assert JSON(response.body)['message'] == "User was successfully destroyed", "loggin out user does not pass correctly"
  end
  
  private
    def log_in(user)
      session[:user_id] = user.id
    end
end
