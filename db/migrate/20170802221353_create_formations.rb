class CreateFormations < ActiveRecord::Migration[5.1]
  def change
    create_table :formations do |t|
      t.string :name
    end
  end
end
