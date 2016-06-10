module SetupApiClient
  def api_client
    @api_client ||= EasybillRestClient::ApiClient.new(
      api_key: ENV.fetch('EASYBILL_API_KEY')
    )
  end
end
