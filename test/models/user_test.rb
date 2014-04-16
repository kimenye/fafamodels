# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  date_of_birth   :date
#  gender_id       :string(255)
#  phone_number    :string(255)

require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should not save user without name" do
    user = User.new email: users(:one).email, password: "password", date_of_birth: "2014-04-14", gender: genders(:male), phone_number: users(:one).phone_number
    assert !user.save, "Cannot save user without name"
  end
  
  test "should not save user without email" do
    user = User.new name: users(:one).name, password: "password", date_of_birth: "2014-04-14", gender: genders(:male), phone_number: users(:one).phone_number
    assert !user.save, "Cannot save user without email"
  end
  
  test "should not save user without password" do
    user = User.new name: users(:one).name, email: users(:one).email, date_of_birth: "2014-04-14", gender: genders(:male), phone_number: users(:one).phone_number
    assert !user.save, "Cannot save user without password"
  end
  
  test "should not save user without date of birth" do
    user = User.new name: users(:one).name, email: users(:one).email, password: "password", gender: genders(:male), phone_number: users(:one).phone_number
    assert !user.save, "Cannot save user without date of birth"
  end
  
  test "should not save user without gender" do
    user = User.new name: users(:one).name, email: users(:one).email, password: "password", date_of_birth: "2014-04-14", phone_number: users(:one).phone_number
    assert !user.save, "Cannot save user without gender"
  end
  
  test "should not save user without phone number" do
    user = User.new name: users(:one).name, email: users(:one).email, password: "password", date_of_birth: "2014-04-14", gender: genders(:male)
    assert !user.save, "Cannot save user without phone number"
  end
end

# name: users(:one).name, email users(:one).email password password date_of_birth 2014-04-14 gender genders(:male) phone_number users(:one).phone_number