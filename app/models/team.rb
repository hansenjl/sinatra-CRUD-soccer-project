class Team < ActiveRecord::Base
  has_secure_password
  belongs_to :formation
  has_many :positions
  has_many :players

  validates :name, presence: true

  def update_team_formation(new_positions)
    self.formation.positions.each do |position|
      position.player = self.players.find_by(:name => new_positions["#{position.name}"])
    end
  end
end