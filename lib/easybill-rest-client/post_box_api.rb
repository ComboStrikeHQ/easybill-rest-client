# frozen_string_literal: true
require 'easybill-rest-client/generic_api'

module EasybillRestClient
  PostBoxApi = GenericApi.new('post-boxes', PostBox)
end
