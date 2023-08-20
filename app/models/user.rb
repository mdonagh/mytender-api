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

class User < ApplicationRecord
  enum kind: [ :drinker, :bartender ]

  has_secure_password

  # after_update :notify_subscriber_of_addition

  validates :email, presence: true, uniqueness: true

  has_many_attached :photos
  has_one_attached :avatar
  has_many :shifts

  before_save :scrub_usernames

  def scrub_usernames
    if self.instagram && self.instagram.start_with?("@")
      self.instagram = self.instagram[1..-1]
    end

    if self.cashapp && !self.cashapp.start_with?("$")
      self.cashapp = "$#{self.cashapp}"
    end

    if self.venmo && self.venmo.start_with?("@")
      self.venmo = self.venmo[1..-1]
    end
  end

  private

  def notify_subscriber_of_addition
    RailsApiBoilerplateSchema.subscriptions.trigger('user_updated', {}, self)
  end
end
