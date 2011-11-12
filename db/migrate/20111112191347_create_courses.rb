class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :university_id
      t.string :title

      t.timestamps
    end
  end
end
