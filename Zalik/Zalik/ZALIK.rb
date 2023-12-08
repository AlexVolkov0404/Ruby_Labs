# frozen_string_literal: true
class Email
  attr_accessor :subject, :sender, :recipient, :date

  def initialize(subject, sender, recipient, date)
    @subject = subject
    @sender = sender
    @recipient = recipient
    @date = date
  end

  def to_s
    "#{@date}: #{@sender} -> #{@recipient}, Subject: #{@subject}"
  end
end

class IncomingEmail < Email
  attr_accessor :category

  def initialize(subject, sender, recipient, date, category)
    super(subject, sender, recipient, date)
    @category = category
  end
end

class SentEmail < Email
end

class Mailbox
  attr_accessor :emails

  def initialize
    @emails = []
  end

  def add_email(email)
    @emails << email
  end

  def sort_by_date
    emails.sort_by { |email| email.date }
  end

  def search_by_subject(keyword)
    emails.select { |email| email.subject.downcase.include?(keyword.downcase) }
  end

  def search_by_sender(sender)
    emails.select { |email| email.sender.downcase == sender.downcase }
  end

  def search_by_recipient(recipient)
    emails.select { |email| email.recipient.downcase == recipient.downcase }
  end

  def search_by_date_range(start_date, end_date)
    emails.select { |email| email.date.between?(start_date, end_date) }
  end
end

# Приклад використання:
inbox = Mailbox.new
inbox.add_email(IncomingEmail.new("Meeting", "john@example.com", "user@example.com", Time.now, "Work"))
inbox.add_email(IncomingEmail.new("Party", "alice@example.com", "user@example.com", Time.now - 86400, "Social"))
inbox.add_email(SentEmail.new("Report", "user@example.com", "boss@example.com", Time.now - 172800))

puts "All emails:"
puts inbox.emails

puts "\nSorted by date:"
puts inbox.sort_by_date

puts "\nSearch by subject 'Meeting':"
puts inbox.search_by_subject("Meeting")

puts "\nSearch by sender 'john@example.com':"
puts inbox.search_by_sender("john@example.com")

puts "\nSearch by recipient 'user@example.com':"
puts inbox.search_by_recipient("user@example.com")

puts "\nSearch by date range (yesterday to today):"
puts inbox.search_by_date_range(Time.now - 86400, Time.now)

