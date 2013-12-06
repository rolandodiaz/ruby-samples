class Pago < ActiveRecord::Base

  attr_accessible :arbitrio, :mora, :persona_id
  belongs_to :persona

end
