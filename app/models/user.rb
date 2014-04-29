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
#  phone_number    :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  has_secure_password(validations: false)
  
  belongs_to :gender
  has_one :measurement
  has_many :photos
  
  validates_presence_of :name, :email, :date_of_birth, :gender, :phone_number
  validates :password, presence: true, :on => :create
  validates_uniqueness_of :email
end
