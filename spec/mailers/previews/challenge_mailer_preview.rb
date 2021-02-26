# Preview all emails at http://localhost:3000/rails/mailers/challenge_mailer
class ChallengeMailerPreview < ActionMailer::Preview
  def new_order_email
    # Set up a temporary order for the preview
    @challenge = Challenge.new(title: "New title for mailer", description: "Desc for mailer", tag: "Activity 1")

    ChallengeMailer.new_order_email
  end
end
