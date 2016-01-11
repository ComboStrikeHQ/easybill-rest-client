require "uri"

module Easybill
  class CustomerApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end

    # Fetch customers list
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :page 
    # @option opts [Integer] :limit 
    # @return [Customers]
    def customers_get(opts = {})
      data, status_code, headers = customers_get_with_http_info(opts)
      return data
    end

    # Fetch customers list
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :page 
    # @option opts [Integer] :limit 
    # @return [Array<(Customers, Fixnum, Hash)>] Customers data, response status code and response headers
    def customers_get_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: CustomerApi#customers_get ..."
      end
      
      # resource path
      path = "/customers".sub('{format}','json')

      # query parameters
      query_params = {}
      query_params[:'page'] = opts[:'page'] if opts[:'page']
      query_params[:'limit'] = opts[:'limit'] if opts[:'limit']

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
        :return_type => 'Customers')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: CustomerApi#customers_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Create customer
    # 
    # @param body 
    # @param [Hash] opts the optional parameters
    # @return [Customer]
    def customers_post(body, opts = {})
      data, status_code, headers = customers_post_with_http_info(body, opts)
      return data
    end

    # Create customer
    # 
    # @param body 
    # @param [Hash] opts the optional parameters
    # @return [Array<(Customer, Fixnum, Hash)>] Customer data, response status code and response headers
    def customers_post_with_http_info(body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: CustomerApi#customers_post ..."
      end
      
      # verify the required parameter 'body' is set
      fail "Missing the required parameter 'body' when calling customers_post" if body.nil?
      
      # resource path
      path = "/customers".sub('{format}','json')

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
        :return_type => 'Customer')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: CustomerApi#customers_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Fetch customer
    # 
    # @param id ID of customer that needs to be fetched
    # @param [Hash] opts the optional parameters
    # @return [Customer]
    def customers_id_get(id, opts = {})
      data, status_code, headers = customers_id_get_with_http_info(id, opts)
      return data
    end

    # Fetch customer
    # 
    # @param id ID of customer that needs to be fetched
    # @param [Hash] opts the optional parameters
    # @return [Array<(Customer, Fixnum, Hash)>] Customer data, response status code and response headers
    def customers_id_get_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: CustomerApi#customers_id_get ..."
      end
      
      # verify the required parameter 'id' is set
      fail "Missing the required parameter 'id' when calling customers_id_get" if id.nil?
      
      # resource path
      path = "/customers/{id}".sub('{format}','json').sub('{' + 'id' + '}', id.to_s)

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
        :return_type => 'Customer')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: CustomerApi#customers_id_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update Customer
    # 
    # @param id ID of customer that needs to be updated
    # @param body 
    # @param [Hash] opts the optional parameters
    # @return [Customer]
    def customers_id_put(id, body, opts = {})
      data, status_code, headers = customers_id_put_with_http_info(id, body, opts)
      return data
    end

    # Update Customer
    # 
    # @param id ID of customer that needs to be updated
    # @param body 
    # @param [Hash] opts the optional parameters
    # @return [Array<(Customer, Fixnum, Hash)>] Customer data, response status code and response headers
    def customers_id_put_with_http_info(id, body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: CustomerApi#customers_id_put ..."
      end
      
      # verify the required parameter 'id' is set
      fail "Missing the required parameter 'id' when calling customers_id_put" if id.nil?
      
      # verify the required parameter 'body' is set
      fail "Missing the required parameter 'body' when calling customers_id_put" if body.nil?
      
      # resource path
      path = "/customers/{id}".sub('{format}','json').sub('{' + 'id' + '}', id.to_s)

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
      data, status_code, headers = @api_client.call_api(:PUT, path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'Customer')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: CustomerApi#customers_id_put\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Delete customer
    # 
    # @param id ID of customer that needs to be deleted
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def customers_id_delete(id, opts = {})
      customers_id_delete_with_http_info(id, opts)
      return nil
    end

    # Delete customer
    # 
    # @param id ID of customer that needs to be deleted
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def customers_id_delete_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: CustomerApi#customers_id_delete ..."
      end
      
      # verify the required parameter 'id' is set
      fail "Missing the required parameter 'id' when calling customers_id_delete" if id.nil?
      
      # resource path
      path = "/customers/{id}".sub('{format}','json').sub('{' + 'id' + '}', id.to_s)

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
        @api_client.config.logger.debug "API called: CustomerApi#customers_id_delete\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end




