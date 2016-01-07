require "uri"

module Easybill
  class DocumentPaymentApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end

    # Fetch document payments list
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :page 
    # @return [DocumentPayments]
    def document_payments_get(opts = {})
      data, status_code, headers = document_payments_get_with_http_info(opts)
      return data
    end

    # Fetch document payments list
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :page 
    # @return [Array<(DocumentPayments, Fixnum, Hash)>] DocumentPayments data, response status code and response headers
    def document_payments_get_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: DocumentPaymentApi#document_payments_get ..."
      end
      
      # resource path
      path = "/document-payments".sub('{format}','json')

      # query parameters
      query_params = {}
      query_params[:'page'] = opts[:'page'] if opts[:'page']

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      _header_accept = ['application/json']
      _header_accept_result = @api_client.select_header_accept(_header_accept) and header_params['Accept'] = _header_accept_result

      # HTTP header 'Content-Type'
      _header_content_type = ['application/json']
      header_params['Content-Type'] = @api_client.select_header_content_type(_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      

      auth_names = ['basicAuth']
      data, status_code, headers = @api_client.call_api(:GET, path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'DocumentPayments')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: DocumentPaymentApi#document_payments_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Create document payment
    # 
    # @param body 
    # @param [Hash] opts the optional parameters
    # @return [DocumentPayment]
    def document_payments_post(body, opts = {})
      data, status_code, headers = document_payments_post_with_http_info(body, opts)
      return data
    end

    # Create document payment
    # 
    # @param body 
    # @param [Hash] opts the optional parameters
    # @return [Array<(DocumentPayment, Fixnum, Hash)>] DocumentPayment data, response status code and response headers
    def document_payments_post_with_http_info(body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: DocumentPaymentApi#document_payments_post ..."
      end
      
      # verify the required parameter 'body' is set
      fail "Missing the required parameter 'body' when calling document_payments_post" if body.nil?
      
      # resource path
      path = "/document-payments".sub('{format}','json')

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      _header_accept = ['application/json']
      _header_accept_result = @api_client.select_header_accept(_header_accept) and header_params['Accept'] = _header_accept_result

      # HTTP header 'Content-Type'
      _header_content_type = ['application/json']
      header_params['Content-Type'] = @api_client.select_header_content_type(_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(body)
      

      auth_names = ['basicAuth']
      data, status_code, headers = @api_client.call_api(:POST, path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'DocumentPayment')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: DocumentPaymentApi#document_payments_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Fetch document payment
    # 
    # @param id ID of document payment
    # @param [Hash] opts the optional parameters
    # @return [DocumentPayment]
    def document_payments_id_get(id, opts = {})
      data, status_code, headers = document_payments_id_get_with_http_info(id, opts)
      return data
    end

    # Fetch document payment
    # 
    # @param id ID of document payment
    # @param [Hash] opts the optional parameters
    # @return [Array<(DocumentPayment, Fixnum, Hash)>] DocumentPayment data, response status code and response headers
    def document_payments_id_get_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: DocumentPaymentApi#document_payments_id_get ..."
      end
      
      # verify the required parameter 'id' is set
      fail "Missing the required parameter 'id' when calling document_payments_id_get" if id.nil?
      
      # resource path
      path = "/document-payments/{id}".sub('{format}','json').sub('{' + 'id' + '}', id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      _header_accept = ['application/json']
      _header_accept_result = @api_client.select_header_accept(_header_accept) and header_params['Accept'] = _header_accept_result

      # HTTP header 'Content-Type'
      _header_content_type = ['application/json']
      header_params['Content-Type'] = @api_client.select_header_content_type(_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      

      auth_names = ['basicAuth']
      data, status_code, headers = @api_client.call_api(:GET, path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'DocumentPayment')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: DocumentPaymentApi#document_payments_id_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Delete document payment
    # 
    # @param id ID of document payment
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def document_payments_id_delete(id, opts = {})
      document_payments_id_delete_with_http_info(id, opts)
      return nil
    end

    # Delete document payment
    # 
    # @param id ID of document payment
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def document_payments_id_delete_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: DocumentPaymentApi#document_payments_id_delete ..."
      end
      
      # verify the required parameter 'id' is set
      fail "Missing the required parameter 'id' when calling document_payments_id_delete" if id.nil?
      
      # resource path
      path = "/document-payments/{id}".sub('{format}','json').sub('{' + 'id' + '}', id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      _header_accept = ['application/json']
      _header_accept_result = @api_client.select_header_accept(_header_accept) and header_params['Accept'] = _header_accept_result

      # HTTP header 'Content-Type'
      _header_content_type = ['application/json']
      header_params['Content-Type'] = @api_client.select_header_content_type(_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      

      auth_names = ['basicAuth']
      data, status_code, headers = @api_client.call_api(:DELETE, path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: DocumentPaymentApi#document_payments_id_delete\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end




