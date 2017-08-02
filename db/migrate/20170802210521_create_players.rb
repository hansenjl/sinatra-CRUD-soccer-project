class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :number
      t.integer :position_id
      t.integer :team_id
    end
  end
end
