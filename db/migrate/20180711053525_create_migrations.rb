class CreateMigrations < ActiveRecord::Migration[5.1]
  def change
    create_table :migrations do |t|
      t.text :content
      t.integer :course_id

      t.timestamps
    end
  end
end
