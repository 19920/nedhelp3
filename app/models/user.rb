class User < ApplicationRecord
  mount_uploader :avatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :first_name, :email,  presence: true
         validates :email, uniqueness: true


         has_many :request_user_id, class_name: 'Conversation', foreign_key: 'request_user_id'
         has_many :requests
          has_many :conversations
          has_many :messages
         has_many :request_owners, class_name: 'Conversation', foreign_key: 'request_owner_id'

         validates_integrity_of  :avatar
           validates_processing_of :avatar

           private
             def avatar_size_validation
               errors[:avatar] << "should be less than 500KB" if avatar.size > 0.5.megabytes
             end
end
