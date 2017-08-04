class Position < ActiveRecord::Base
  belongs_to :formation
  has_one :player
end