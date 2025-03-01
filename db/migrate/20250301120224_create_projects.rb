class CreateProjects < ActiveRecord::Migration[8.0]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.string :status, null: false, default: 'open'
      t.timestamps
    end
  end
end
