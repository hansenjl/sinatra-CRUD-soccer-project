class Formation < ActiveRecord::Base
  has_many :teams
  has_many :positions
  has_many :players, through: :positions

  validates :name, presence: true

  def make_positions_for_formation_4_4_2
    [
      "Left Forward",
      "Right Forward"
    ].each { |name| self.positions.create(name: name) }

      formation.positions.create(:name => "Left Forward")
      formation.positions << Position.create(:name => "Right Forward",:formation_id => formation.id)
      formation.positions << Position.create(:name => "Attacking Mid",:formation_id => formation.id)
      formation.positions << Position.create(:name => "Left Mid",:formation_id => formation.id)
      formation.positions << Position.create(:name => "Defending Mid",:formation_id => formation.id)
      formation.positions << Position.create(:name => "Right Mid",:formation_id => formation.id)
      formation.positions << Position.create(:name => "Left Defender",:formation_id => formation.id)
      formation.positions << Position.create(:name => "Stopper",:formation_id => formation.id)
      formation.positions << Position.create(:name => "Right Defender",:formation_id => formation.id)
     formation.positions <<  Position.create(:name => "Sweeper",:formation_id => formation.id)
      formation.positions << Position.create(:name => "Goalie",:formation_id => formation.id)
    end
end