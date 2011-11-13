class AddDeltaToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :delta, :boolean
  end
end
