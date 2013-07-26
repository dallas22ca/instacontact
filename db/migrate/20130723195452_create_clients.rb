class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :company
      t.string :email
      t.string :phone
      t.string :initiated_by
      t.string :state

      t.timestamps
    end
  end
end
