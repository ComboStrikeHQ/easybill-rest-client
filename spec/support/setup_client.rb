# frozen_string_literal: true

require 'logger'

module SetupClient
  def client
    @client ||= EasybillRestClient::Client.new(
      api_key: ENV.fetch('EASYBILL_API_KEY'),
      logger: Logger.new('log/test.log')
    )
  end
end
