# frozen_string_literal: true
module SetupClient
  def client
    @client ||= EasybillRestClient::Client.new(
      api_key: ENV.fetch('EASYBILL_API_KEY')
    )
  end
end
