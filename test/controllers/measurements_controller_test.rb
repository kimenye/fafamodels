require "test_helper"

class MeasurementsControllerTest < ActionController::TestCase

  before do
    @current_user = users(:one)
    @measurement = measurements(:one)
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:measurements)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference('Measurement.count') do
      post :create, measurement: {  }
    end

    assert_redirected_to measurement_path(assigns(:measurement))
  end

  def test_show
    get :show, id: @measurement
    assert_response :success
  end

  def test_edit
    get :edit, id: @measurement
    assert_response :success
  end

  def test_update
    put :update, id: @measurement, measurement: {  }
    assert_redirected_to measurement_path(assigns(:measurement))
  end

  def test_destroy
    assert_difference('Measurement.count', -1) do
      delete :destroy, id: @measurement
    end

    assert_redirected_to measurements_path
  end
end
