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
require 'rails_helper'

RSpec.describe Deleterequest, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
