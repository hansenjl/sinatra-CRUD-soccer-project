class Formation < ActiveRecord::Base
  has_many :teams
  has_many :positions
  has_many :players, through: :positions
end