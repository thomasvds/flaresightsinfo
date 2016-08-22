class SlackNotifierJob < ActiveJob::Base
  queue_as :default

  def perform(lead)
    payload = {
      username:         "New lead!",
      text:             lead.email.to_s
    }
    uri = URI.parse("https://hooks.slack.com/services/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")
    Net::HTTP.post_form(uri, :payload => JSON.generate(payload))
  end
end

