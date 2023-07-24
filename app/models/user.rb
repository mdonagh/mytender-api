# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  banner_url      :string
#  email           :citext           not null, indexed
#  headshot_url    :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#

class User < ApplicationRecord
  has_secure_password

  # after_update :notify_subscriber_of_addition

  validates :email, presence: true, uniqueness: true

  has_many_attached :photos
  has_one_attached :avatar

  private

  def notify_subscriber_of_addition
    RailsApiBoilerplateSchema.subscriptions.trigger('user_updated', {}, self)
  end
end
