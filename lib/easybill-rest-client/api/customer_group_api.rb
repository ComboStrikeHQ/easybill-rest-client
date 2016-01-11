require "uri"

module Easybill
  class CustomerGroupApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end

    # Fetch customer group list
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :page 
    # @option opts [Integer] :limit 
    # @return [CustomerGroups]
    def customer_groups_get(opts = {})
      data, status_code, headers = customer_groups_get_with_http_info(opts)
      return data
    end

    # Fetch customer group list
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :page 
    # @option opts [Integer] :limit 
    # @return [Array<(CustomerGroups, Fixnum, Hash)>] CustomerGroups data, response status code and response headers
    def customer_groups_get_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: CustomerGroupApi#customer_groups_get ..."
      end
      
      # resource path
      path = "/customer-groups".sub('{format}','json')

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
        :return_type => 'CustomerGroups')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: CustomerGroupApi#customer_groups_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Create customer froup
    # 
    # @param body 
    # @param [Hash] opts the optional parameters
    # @return [CustomerGroup]
    def customer_groups_post(body, opts = {})
      data, status_code, headers = customer_groups_post_with_http_info(body, opts)
      return data
    end

    # Create customer froup
    # 
    # @param body 
    # @param [Hash] opts the optional parameters
    # @return [Array<(CustomerGroup, Fixnum, Hash)>] CustomerGroup data, response status code and response headers
    def customer_groups_post_with_http_info(body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: CustomerGroupApi#customer_groups_post ..."
      end
      
      # verify the required parameter 'body' is set
      fail "Missing the required parameter 'body' when calling customer_groups_post" if body.nil?
      
      # resource path
      path = "/customer-groups".sub('{format}','json')

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
        :return_type => 'CustomerGroup')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: CustomerGroupApi#customer_groups_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Fetch customer group
    # 
    # @param id ID of customer group
    # @param [Hash] opts the optional parameters
    # @return [CustomerGroup]
    def customer_groups_id_get(id, opts = {})
      data, status_code, headers = customer_groups_id_get_with_http_info(id, opts)
      return data
    end

    # Fetch customer group
    # 
    # @param id ID of customer group
    # @param [Hash] opts the optional parameters
    # @return [Array<(CustomerGroup, Fixnum, Hash)>] CustomerGroup data, response status code and response headers
    def customer_groups_id_get_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: CustomerGroupApi#customer_groups_id_get ..."
      end
      
      # verify the required parameter 'id' is set
      fail "Missing the required parameter 'id' when calling customer_groups_id_get" if id.nil?
      
      # resource path
      path = "/customer-groups/{id}".sub('{format}','json').sub('{' + 'id' + '}', id.to_s)

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
        :return_type => 'CustomerGroup')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: CustomerGroupApi#customer_groups_id_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update customer group
    # 
    # @param id ID of customer goup
    # @param body 
    # @param [Hash] opts the optional parameters
    # @return [CustomerGroup]
    def customer_groups_id_put(id, body, opts = {})
      data, status_code, headers = customer_groups_id_put_with_http_info(id, body, opts)
      return data
    end

    # Update customer group
    # 
    # @param id ID of customer goup
    # @param body 
    # @param [Hash] opts the optional parameters
    # @return [Array<(CustomerGroup, Fixnum, Hash)>] CustomerGroup data, response status code and response headers
    def customer_groups_id_put_with_http_info(id, body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: CustomerGroupApi#customer_groups_id_put ..."
      end
      
      # verify the required parameter 'id' is set
      fail "Missing the required parameter 'id' when calling customer_groups_id_put" if id.nil?
      
      # verify the required parameter 'body' is set
      fail "Missing the required parameter 'body' when calling customer_groups_id_put" if body.nil?
      
      # resource path
      path = "/customer-groups/{id}".sub('{format}','json').sub('{' + 'id' + '}', id.to_s)

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
        :return_type => 'CustomerGroup')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: CustomerGroupApi#customer_groups_id_put\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Delete customer group
    # 
    # @param id ID of customer group
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def customer_groups_id_delete(id, opts = {})
      customer_groups_id_delete_with_http_info(id, opts)
      return nil
    end

    # Delete customer group
    # 
    # @param id ID of customer group
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def customer_groups_id_delete_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: CustomerGroupApi#customer_groups_id_delete ..."
      end
      
      # verify the required parameter 'id' is set
      fail "Missing the required parameter 'id' when calling customer_groups_id_delete" if id.nil?
      
      # resource path
      path = "/customer-groups/{id}".sub('{format}','json').sub('{' + 'id' + '}', id.to_s)

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
        @api_client.config.logger.debug "API called: CustomerGroupApi#customer_groups_id_delete\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end




