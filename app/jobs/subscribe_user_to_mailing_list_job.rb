class SubscribeUserToMailingListJob < ActiveJob::Base
  queue_as :default

  def perform(subscriber)
    gb = Gibbon::Request.new
    gb.lists(ENV["MAILCHIMP_LIST_ID"]).members.create(body: {email_address: subscriber.email, status: 'subscribed', merge_fields: {FNAME: subscriber.first_name}})
  end
end
