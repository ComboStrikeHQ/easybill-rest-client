# frozen_string_literal: true
require 'easybill-rest-client/generic_api'

module EasybillRestClient
  class PostBoxApi < GenericApi
    def resource_name
      'post-boxes'
    end

    def resource_class
      PostBox
    end
  end
end
