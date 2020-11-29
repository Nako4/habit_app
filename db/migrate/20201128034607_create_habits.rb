class CreateHabits < ActiveRecord::Migration[6.0]
  def change
    create_table :habits do |t|
      t.boolean :checked
      t.integer :user_id, foreign_key: true
      t.text :action, foreign_key: true
      t.timestamps
    end
  end
end
