# == Schema Information
#
# Table name: deleterequests
#
#  id         :bigint           not null, primary key
#  comments   :string
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Deleterequest < ApplicationRecord
end
