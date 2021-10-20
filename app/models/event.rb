class Event < ApplicationRecord
  validates :title, presence: true
  validates :time, presence: true
  validates :date, presence: true
  validates :runtime, presence: true
  belongs_to :user
  has_many :attendees
  has_many :users, through: :attendees

  #   def host?
  #     if user_id == user
  #       'hosting'
  #     else
  #       "#{user_id} is hosting"
  #   end
  # end
end
