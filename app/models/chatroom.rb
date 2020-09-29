class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :users, through: :latest_messages
  validates :topic, presence: true, uniqueness: true, case_sensitive: false
end
