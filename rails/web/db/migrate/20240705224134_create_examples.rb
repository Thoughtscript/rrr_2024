class CreateExamples < ActiveRecord::Migration[7.1]
    def change
      create_table :examples do |t|
        t.text :name
  
        t.timestamps
      end
    end
  end
  