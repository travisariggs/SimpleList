class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
    	t.string :description
    	t.integer :priority
    	t.date :due_date
    	t.timestamps
    end
  end
end
