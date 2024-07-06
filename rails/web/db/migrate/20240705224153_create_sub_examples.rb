class CreateSubExamples < ActiveRecord::Migration[7.1]
    def change
      create_table :sub_examples do |t|
        # Specifies the column name -> example_id
        # Creates an index but no FK constraint
        # An explicit mapping to a table can be done by query or within the model via class_name
        t.belongs_to :example

        t.text :name

        t.timestamps
      end
    end
  end
  