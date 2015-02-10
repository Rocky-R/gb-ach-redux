class RemoveIdcolumns < ActiveRecord::Migration
  def change
    drop_table :achievements_students
    create_table :achievements_students do |t|
      t.references :achievement
      t.references :student

      t.timestamps null: false
    end
  end
end
