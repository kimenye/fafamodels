# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  email            :string(255)
#  gender_id        :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  modelling_agency :string(255)
#  phone_number     :string(255)
#  country          :string(255)
#  town             :string(255)
#

class User < ActiveRecord::Base
  belongs_to :gender
  has_one :measurement
  has_many :photos
  
  validates_presence_of :name, :email, :gender, :modelling_agency, :phone_number, :country, :town
  validates_uniqueness_of :email
end
