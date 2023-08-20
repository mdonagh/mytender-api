# == Schema Information
#
# Table name: users
#
#  id                  :bigint           not null, primary key
#  banner_url          :string
#  cancellation_reason :string
#  cashapp             :string
#  description         :string
#  email               :citext           not null, indexed
#  headshot_url        :string
#  instagram           :string
#  kind                :integer
#  password_digest     :string
#  seeded              :boolean
#  venmo               :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  customer_id         :string
#  subscription_id     :string
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
