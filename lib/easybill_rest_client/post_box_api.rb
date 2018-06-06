# frozen_string_literal: true

require 'easybill_rest_client/generic_api'

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
