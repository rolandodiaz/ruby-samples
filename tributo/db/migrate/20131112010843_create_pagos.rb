class CreatePagos < ActiveRecord::Migration
  def change
    create_table :pagos do |t|
      t.integer :arbitrio
      t.integer :mora

      t.timestamps
    end
  end
end
