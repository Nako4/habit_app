class CreateHabits < ActiveRecord::Migration[6.0]
  def change
    create_table :habits do |t|
      t.integer :user_id, foreign_key: true
      t.date :date, null: false
      t.integer :achieve

      t.timestamps
    end
  end
end
