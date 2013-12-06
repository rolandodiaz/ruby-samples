class AddPersonaIdToPago < ActiveRecord::Migration
  def change
    add_column :pagos, :persona_id, :integer
  end
end
