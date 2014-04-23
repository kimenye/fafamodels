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
    user = User.new email: "user@email.com", password: "password", date_of_birth: "2014-04-14", gender: genders(:male), phone_number: users(:one).phone_number
    assert !user.save, "Cannot save user without name"
    assert assert user.errors[:name].first == "can't be blank"
  end


  test "should not save user without email" do
    user = User.new name: "user1@email.com", password: "password", date_of_birth: "2014-04-14", gender: genders(:male), phone_number: users(:one).phone_number
    assert !user.save, "Cannot save user without email"
    assert assert user.errors[:email].first == "can't be blank"
  end



  test "should not save user without password" do
    user = User.new name: users(:one).name, email: "user2@email.com", date_of_birth: "2014-04-14", gender: genders(:male), phone_number: users(:one).phone_number
    assert !user.save, "Cannot save user without password"
    assert assert user.errors[:password].first == "can't be blank"
  end

  test "should not save user without date of birth" do
    user = User.new name: users(:one).name, email: "user3@email.com", password: "password", gender: genders(:male), phone_number: users(:one).phone_number
    assert !user.save, "Cannot save user without date of birth"
    assert assert user.errors[:date_of_birth].first == "can't be blank"
  end
  
  test "should not save user without gender" do
    user = User.new name: users(:one).name, email: "user4@email.com", password: "password", date_of_birth: "2014-04-14", phone_number: users(:one).phone_number
    assert !user.save, "Cannot save user without gender"
    assert assert user.errors[:gender].first == "can't be blank"
  end
  
  test "should not save user without phone number" do
    user = User.new name: users(:one).name, email: "user5@email.com", password: "password", date_of_birth: "2014-04-14", gender: genders(:male)
    assert !user.save, "Cannot save user without phone number"
    assert assert user.errors[:phone_number].first == "can't be blank"
  end
  
  test "should accept unique email for users" do
    user1 = User.new name: "name1", email: "user6@email.com", password: "password", date_of_birth: "2014-04-14", gender: genders(:male), phone_number: users(:one).phone_number
    assert user1.save, "does not save user with correct params"
    
    user2 = User.new name: "Mike Jones", email: "user6@email.com", password: "password", date_of_birth: "2014-04-14", gender: genders(:male), phone_number: users(:one).phone_number
    assert !user2.save, "Should not save with duplicate email"
    assert user2.errors[:email].first == "has already been taken", "error on email should reject dups"
  end
  
  test "should require password on creation but not on update" do
    user = User.new name: users(:one).name, email: "user8@email.com", password: "password", date_of_birth: "2014-04-14", gender: genders(:male), phone_number: users(:one).phone_number
    assert user.update(name: "Tom Hanks")
  end
end