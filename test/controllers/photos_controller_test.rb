require "test_helper"

class PhotosControllerTest < ActionController::TestCase

  before do
    @test_user = users(:one)
    @photo = @test_user.photos.build
  end

  # def test_index
#     get :index
#     assert_response :success
#     assert_not_nil assigns(:photos)
#   end
# 
#   def test_new
#     get :new
#     assert_response :success
#   end

  def test_create
    file = fixture_file_upload('files/test_file.png','application/json')
    
    assert_difference('Photo.count') do
      post :create, photo: {user_id: users(:one).id, image: file }
    end
  
    assert JSON(response.body)['message'] == "Photo was successfully added", "added does not pass correctly"
    assert JSON(response.body)['status'] == "success", "added photo does not return correct status"
  end

  # def test_show
#     get :show, id: @photo
#     assert_response :success
#   end
# 
#   def test_edit
#     get :edit, id: @photo
#     assert_response :success
#   end
# 
#   def test_update
#     put :update, id: @photo, photo: {  }
#     assert_redirected_to photo_path(assigns(:photo))
#   end

  # def test_destroy
#     assert_difference('Photo.count', -1) do
#       delete :destroy, id: @photo
#     end
# 
#     assert_redirected_to photos_path
#   end
end
