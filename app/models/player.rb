class Player < ActiveRecord::Base
  belongs_to :position
  belongs_to :team
end