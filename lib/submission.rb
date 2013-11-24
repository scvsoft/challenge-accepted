class Submission < Ohm::Model
  attribute :token
  attribute :challenge_number
  attribute :code
  attribute :type
  attribute :created_at

  index :token
  index :challenge_number

  def initialize(params = {})
    params[:created_at] = Time.now.to_i
    super
  end
end
