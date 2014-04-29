# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  image_uid  :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Photo < ActiveRecord::Base
  belongs_to :user, :dependent => :delete
  
  dragonfly_accessor :image
end
