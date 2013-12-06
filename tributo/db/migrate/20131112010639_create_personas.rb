class CreatePersonas < ActiveRecord::Migration
  def change
    create_table :personas do |t|
      t.integer :dni

      t.timestamps
    end
  end
end
