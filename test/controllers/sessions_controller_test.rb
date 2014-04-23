require "test_helper"

class SessionsControllerTest < ActionController::TestCase
  def test_sign_in_with_correct_creds
    post :create, {email: "email@www.com", password: "password"}
    assert JSON(response.body)['message'] == "You are logged in", "sign in does not pass correctly"
    assert JSON(response.body)['status'] == "success", "sign in does not pass correct status"
  end
  
  def test_sign_in_with_incorrect_creds
    post :create, {email: "email@www.com", password: "wrong_password"}
    assert response.body == "{\"message\":\"Email or password is invalid\",\"status\":\"unprocessable_entity\"}", "sign in does not fail correctlly"
  end
  
  def test_sign_out
    delete :destroy
    assert response.body == "{\"message\":\"You are logged out\",\"status\":\"success\"}", "log out does not pass correctly"
  end
end

