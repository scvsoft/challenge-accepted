class Submission < Ohm::Model
  attribute :token
  attribute :challenge_number
  attribute :code
  attribute :type
  attribute :created_at

  index :token
  index :challenge_number
end
