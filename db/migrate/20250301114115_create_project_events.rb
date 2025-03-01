class CreateProjectEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :project_events do |t|
      t.references :project, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :event_type, null: false  
      t.text :content                     
      t.string :new_status                
      t.string :old_status 
      t.timestamps
    end
  end
end
