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
#  seeded          :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#

class User < ApplicationRecord
  enum kind: [ :drinker, :bartender ]

  has_secure_password

  # after_update :notify_subscriber_of_addition

  validates :email, presence: true, uniqueness: true

  has_many_attached :photos
  has_one_attached :avatar
  has_many :shifts

  private

  def notify_subscriber_of_addition
    RailsApiBoilerplateSchema.subscriptions.trigger('user_updated', {}, self)
  end
end
