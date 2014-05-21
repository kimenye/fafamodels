require "test_helper"

class UsersControllerTest < ActionController::TestCase
  before do
    @test_user = users(:one)
  end

  def test_create_user_correctly
  assert_difference('User.count') do
    post :create, user: { name: "name", email: "here@now.com", gender_id: genders(:male)}
  end
  
  assert JSON(response.body)['message'] == "User was successfully created", "created user does not pass correctly"
  assert JSON(response.body)['status'] == "success", "created user does not pass correct status"
  assert JSON(response.body)['user_id'] != nil, "user id not passed back"
  assert_not_nil User.find(JSON(response.body)['user_id']).measurement, "measurements not created for user"
  end

  def test_create_user_incorrectly
   assert_no_difference('User.count') do
     post :create, user: {email: "here@now.com", gender_id: genders(:male)}
   end
 
   assert JSON(response.body)['message'] == "User was not created", "created user does not fail correctly"
   assert JSON(response.body)['status'] == "unprocessable_entity", "created user does not pass correct status"
  end

  def test_update_user
   put :update, id: @test_user, user: { name: "name2" }
 
   assert JSON(response.body)['message'] == "User was successfully updated", "updated user does not pass correctly"
   assert JSON(response.body)['status'] == "success", "updated user does not pass correct status"
  end

  def test_destroy
   assert_difference('User.count', -1) do
     delete :destroy, id: @test_user
   end
   assert JSON(response.body)['message'] == "User was successfully destroyed", "destroying user does not pass correctly"
  end

end
