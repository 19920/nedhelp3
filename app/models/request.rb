class Request < ApplicationRecord


  belongs_to :user
  #has_many :messages
  has_many :conversations
  validates_presence_of :title, :description,:request_type


  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

    reverse_geocoded_by :latitude , :longitude
    after_validation :reverse_geocode
    def volunteered_by?(user)
      conversations.where(sender_id: user.id).any?
    end
end
