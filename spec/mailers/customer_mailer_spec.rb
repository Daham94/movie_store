require "rails_helper"

RSpec.describe CustomerMailer, type: :mailer do
  describe "reminder" do
    let(:mail) { CustomerMailer.reminder }

    it "renders the headers" do
      expect(mail.subject).to eq("Reminder")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "warning" do
    let(:mail) { CustomerMailer.warning }

    it "renders the headers" do
      expect(mail.subject).to eq("Warning")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
