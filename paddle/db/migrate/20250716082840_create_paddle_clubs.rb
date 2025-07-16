class CreatePaddleClubs < ActiveRecord::Migration[8.0]
  def change
    create_table :paddle_clubs do |t|
      t.string :name
      t.string :tier_id

      t.timestamps
    end
  end
end
