class Team < ActiveRecord::Base
  has_secure_password
  belongs_to :formation
  has_many :positions
  has_many :players

  validates :name, presence: true
end