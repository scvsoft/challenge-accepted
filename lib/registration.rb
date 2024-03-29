require 'securerandom'

class Registration < Ohm::Model
  attribute :token
  attribute :email

  unique :email
  index :token
  index :email

  def validate
    assert_present :email
    assert_email :email
  end

  def generate_token
    self.token = SecureRandom.hex(16)
  end
end
