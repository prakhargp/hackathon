class Find_challenges
  def initialize(challenge)
    @challenge = challenge
  end

  def call(params)
    @challenge.order("created_at ")
  end
end
