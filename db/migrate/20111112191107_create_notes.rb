class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :course_module_id
      t.string :title

      t.timestamps
    end
  end
end
