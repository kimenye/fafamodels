require "test_helper"

class MeasurementsControllerTest < ActionController::TestCase
  before do
    @test_user = users(:one)
    @measurements = users(:one).create_measurement
  end
  
  def test_update
    put :update, id: users(:one).id, measurement: { height:"175",eye_colour:"black",hair_colour:"black",skin_colour:"black",shoe_size:"43",neck: "13",suit_size: "42R",shoulders:"13",shirt_size:"large",inside_leg_size:"24",bust:"DD",bra_size:"23DD",waist:"32",hips:"34",dress_size:"large",clothing_size_age:"13" }
    
    assert JSON(response.body)['status'] == "success", "updated user does not pass correct status"
  end
end
