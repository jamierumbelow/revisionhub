class CreateCourseModules < ActiveRecord::Migration
  def change
    create_table :course_modules do |t|
      t.integer :course_id
      t.string :title

      t.timestamps
    end
  end
end
