# == Schema Information
#
# Table name: shifts
#
#  id         :bigint           not null, primary key
#  address    :string
#  duration   :integer
#  lat        :decimal(10, 2)   indexed
#  notes      :string
#  recurring  :boolean
#  start_time :datetime         indexed
#  upccode    :decimal(10, 2)   indexed
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           indexed
#
# Indexes
#
#  index_shifts_on_lat         (lat)
#  index_shifts_on_start_time  (start_time)
#  index_shifts_on_upccode     (upccode)
#  index_shifts_on_user_id     (user_id)
#

class Shift < ApplicationRecord
  has_secure_password

  after_update :notify_subscriber_of_addition

  validates :email, presence: true, uniqueness: true

  private

  def notify_subscriber_of_addition
    RailsApiBoilerplateSchema.subscriptions.trigger('user_updated', {}, self)
  end
end
