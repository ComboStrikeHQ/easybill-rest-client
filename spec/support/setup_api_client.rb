module SetupApiClient
  def api_client
    @api_client ||= EasybillRestClient::ApiClient.new(
      username: ENV.fetch('EASYBILL_USERNAME'),
      password: ENV.fetch('EASYBILL_API_KEY')
    )
  end
end
