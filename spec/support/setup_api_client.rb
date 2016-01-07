module SetupApiClient
  def api_client
    return @api_client if @api_client

    config = Easybill::Configuration.new do |config|
      config.username = ENV.fetch('EASYBILL_USERNAME')
      config.password = ENV.fetch('EASYBILL_API_KEY')
      # config.debugging = true
      config.ssl_ca_cert = OpenSSL::X509::DEFAULT_CERT_FILE
    end
    @api_client = Easybill::ApiClient.new(config)
  end
end
