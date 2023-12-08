require 'rspec'

require_relative 'ZALIK'

RSpec.describe Mailbox do
  let(:inbox) { Mailbox.new }

  describe "#add_email" do
    it "adds an email to the emails list" do
      email = Email.new("Test Email", "sender@example.com", "recipient@example.com", Time.now)
      inbox.add_email(email)
      expect(inbox.emails).to include(email)
    end
  end

  describe "#sort_by_date" do
    it "sorts emails by date in ascending order" do
      email1 = Email.new("Email 1", "sender@example.com", "recipient@example.com", Time.now)
      email2 = Email.new("Email 2", "sender@example.com", "recipient@example.com", Time.now - 86400)
      inbox.add_email(email1)
      inbox.add_email(email2)
      sorted_emails = inbox.sort_by_date
      expect(sorted_emails).to eq([email2, email1])
    end
  end

  describe "#search_by_subject" do
    it "returns emails with the specified subject" do
      meeting_email = Email.new("Meeting", "john@example.com", "user@example.com", Time.now)
      party_email = Email.new("Party", "alice@example.com", "user@example.com", Time.now - 86400)
      inbox.add_email(meeting_email)
      inbox.add_email(party_email)
      expect(inbox.search_by_subject("Meeting")).to eq([meeting_email])
    end

    it "returns an empty array if no emails match the specified subject" do
      expect(inbox.search_by_subject("Unknown Subject")).to eq([])
    end
  end

  # Add more test cases for other methods...

end

