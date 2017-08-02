class Team < ActiveRecord::Base
  belongs_to :formation
  has_many :positions
  has_many :players
end