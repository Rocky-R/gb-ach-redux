class RemoveParentIdFromStudent < ActiveRecord::Migration
  def change
    remove_column :students, :parent_id, :integer
    remove_column :parents, :teacher_id, :integer
    add_column :parents, :student_id, :integer
  end
end
