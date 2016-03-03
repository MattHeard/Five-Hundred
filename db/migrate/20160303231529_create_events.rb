class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :state_attribute
      t.string :encoded_value
      t.references :game, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
