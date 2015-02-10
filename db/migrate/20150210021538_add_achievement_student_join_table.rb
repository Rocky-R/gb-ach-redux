class AddAchievementStudentJoinTable < ActiveRecord::Migration
  def change
    create_table :achievements_students do |t|
      t.references :achievements_id
      t.references :students_id

      t.timestamps null: false
    end
  end
end
