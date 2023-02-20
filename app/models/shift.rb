# == Schema Information
#
# Table name: shifts
#
#  id         :bigint           not null, primary key
#  address    :string
#  duration   :integer
#  latitude   :decimal(10, 2)   indexed => [longitude, start_time]
#  longitude  :decimal(10, 2)   indexed => [latitude, start_time]
#  notes      :string
#  recurring  :boolean
#  start_time :datetime         indexed => [latitude, longitude]
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           indexed
#
# Indexes
#
#  index_shifts_on_latitude_and_longitude_and_start_time  (latitude,longitude,start_time)
#  index_shifts_on_user_id                                (user_id)
#

class Shift < ApplicationRecord
  reverse_geocoded_by :latitude, :longitude

  belongs_to :user, optional: true
end