# == Schema Information
#
# Table name: users
#
#  id                  :bigint           not null, primary key
#  banner_url          :string
#  cancellation_reason :string
#  description         :string
#  email               :citext           not null, indexed
#  headshot_url        :string
#  kind                :integer
#  password_digest     :string
#  seeded              :boolean
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  customer_id         :string
#  subscription_id     :string
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#

RSpec.describe User, type: :model do
  subject(:user) { create(:user) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  end
end
