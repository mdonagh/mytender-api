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
FactoryBot.define do
  factory :deleterequest do
    username { "MyString" }
    comments { "MyString" }
  end
end
