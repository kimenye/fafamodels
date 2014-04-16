require "test_helper"

class UsersControllerTest < ActionController::TestCase

  before do
    @user = users(:one)
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference('User.count') do
      post :create, user: { name: "name", email: "here@now.com", password: "password", date_of_birth: "2014-04-14", gender_id: genders(:male), phone_number: "1234567" }
    end

    assert_redirected_to new_measurement_path)
  end

  def test_show
    get :show, id: @user
    assert_response :success
  end

  def test_edit
    get :edit, id: @user
    assert_response :success
  end

  def test_update
    put :update, id: @user, user: { name: "name2" }
    assert_redirected_to user_path(assigns(:user))
  end

  def test_destroy
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
