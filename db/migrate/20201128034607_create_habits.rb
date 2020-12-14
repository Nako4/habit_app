class CreateHabits < ActiveRecord::Migration[6.0]
  def change
    create_table :habits do |t|
      t.integer :user_id, foreign_key: true
      t.date :date
      t.text :action, foreign_key: true
      t.boolean :checked

      t.timestamps
    end
  end
end
