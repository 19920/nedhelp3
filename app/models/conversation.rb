class Conversation < ApplicationRecord
   belongs_to :sender, class_name: "User", foreign_key: "sender_id"
   belongs_to :recipient, class_name: "User", foreign_key: "recipient_id"
   belongs_to :request, class_name: "Request", foreign_key: "request_id"
   belongs_to :request, counter_cache: true
   has_many :messages, dependent: :destroy
   validates_uniqueness_of :sender_id, :scope => :recipient_id, :scope => :request_id
   scope :between, ->(sender_id, request_id) {where(sender_id: sender_id, request_id: request_id)}
    



end
