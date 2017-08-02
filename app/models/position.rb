class Position < ActiveRecord::Base
  belongs_to :formation
  has_many :players
end