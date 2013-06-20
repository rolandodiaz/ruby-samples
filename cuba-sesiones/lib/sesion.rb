
class Sesion < Ohm::Model

	attribute  :title
	attribute  :description
	attribute  :ponente

	collection :comments, :Comment 

  def validate
    assert_present :title
    assert_present :description
    assert_present :ponente
  end
  
end