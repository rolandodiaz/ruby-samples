class Persona < ActiveRecord::Base
  attr_accessible :dni
  has_many :pagos
end
