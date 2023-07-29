# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  banner_url      :string
#  description     :string
#  email           :citext           not null, indexed
#  headshot_url    :string
#  kind            :integer
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end
