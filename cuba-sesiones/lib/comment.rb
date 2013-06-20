

class Comment < Ohm::Model
  attribute :body
  attribute :rating
  attribute :user

  reference :sesion, :Sesion

  def validate
    assert_present :body
    assert_present :user
    assert_present :rating
  end

end