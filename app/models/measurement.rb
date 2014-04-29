# == Schema Information
#
# Table name: measurements
#
#  id                :integer          not null, primary key
#  height            :string(255)
#  eye_colour        :string(255)
#  hair_colour       :string(255)
#  skin_colour       :string(255)
#  shoe_size         :string(255)
#  neck              :string(255)
#  suit_size         :string(255)
#  shoulders         :string(255)
#  shirt_size        :string(255)
#  inside_leg_size   :string(255)
#  bust              :string(255)
#  bra_size          :string(255)
#  waist             :string(255)
#  hips              :string(255)
#  dress_size        :string(255)
#  clothing_size_age :string(255)
#  user_id           :integer
#  created_at        :datetime
#  updated_at        :datetime
#

class Measurement < ActiveRecord::Base
  belongs_to :user, :dependent => :delete
end
