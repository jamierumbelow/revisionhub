class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name

      t.timestamps
    end
    
    create_table :notes_tags do |t|
      t.integer :note_id
      t.integer :tag_id
    end
  end
end
