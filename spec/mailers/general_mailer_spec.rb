require "rails_helper"

RSpec.describe GeneralMailer, type: :mailer do
  describe "feedback_notification" do
    let(:mail) { GeneralMailer.feedback_notification }

    it "renders the headers" do
      expect(mail.subject).to eq("Feedback notification")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
