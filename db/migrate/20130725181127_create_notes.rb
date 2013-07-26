class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.belongs_to :client, index: true
      t.text :body

      t.timestamps
    end
  end
end
