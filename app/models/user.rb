# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  gender_id  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  belongs_to :gender
  has_one :measurement
  has_many :photos
  
  validates_presence_of :name, :email, :gender
  validates_uniqueness_of :email
end
