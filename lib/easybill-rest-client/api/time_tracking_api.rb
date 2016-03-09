=begin
easybill REST API

Authenticate with HTTP Basic Auth.\n* Username: `easybill email`\n  \n* Password: `SOAP API key`

OpenAPI spec version: 1.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git


=end

require "uri"

module EasybillRestClient
  class TimeTrackingApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end

    # Fetch time trackings list
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :page 
    # @option opts [Integer] :limit 
    # @return [TimeTrackings]
    def time_trackings_get(opts = {})
      data, status_code, headers = time_trackings_get_with_http_info(opts)
      return data
    end

    # Fetch time trackings list
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :page 
    # @option opts [Integer] :limit 
    # @return [Array<(TimeTrackings, Fixnum, Hash)>] TimeTrackings data, response status code and response headers
    def time_trackings_get_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: TimeTrackingApi#time_trackings_get ..."
      end
      
      # resource path
      local_var_path = "/time-trackings".sub('{format}','json')

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
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'TimeTrackings')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TimeTrackingApi#time_trackings_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Delete time tracking
    # 
    # @param id ID of time tracking
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def time_trackings_id_delete(id, opts = {})
      time_trackings_id_delete_with_http_info(id, opts)
      return nil
    end

    # Delete time tracking
    # 
    # @param id ID of time tracking
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def time_trackings_id_delete_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: TimeTrackingApi#time_trackings_id_delete ..."
      end
      
      # verify the required parameter 'id' is set
      fail "Missing the required parameter 'id' when calling time_trackings_id_delete" if id.nil?
      
      # resource path
      local_var_path = "/time-trackings/{id}".sub('{format}','json').sub('{' + 'id' + '}', id.to_s)

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
      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TimeTrackingApi#time_trackings_id_delete\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Fetch time tracking
    # 
    # @param id ID of time tracking
    # @param [Hash] opts the optional parameters
    # @return [TimeTracking]
    def time_trackings_id_get(id, opts = {})
      data, status_code, headers = time_trackings_id_get_with_http_info(id, opts)
      return data
    end

    # Fetch time tracking
    # 
    # @param id ID of time tracking
    # @param [Hash] opts the optional parameters
    # @return [Array<(TimeTracking, Fixnum, Hash)>] TimeTracking data, response status code and response headers
    def time_trackings_id_get_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: TimeTrackingApi#time_trackings_id_get ..."
      end
      
      # verify the required parameter 'id' is set
      fail "Missing the required parameter 'id' when calling time_trackings_id_get" if id.nil?
      
      # resource path
      local_var_path = "/time-trackings/{id}".sub('{format}','json').sub('{' + 'id' + '}', id.to_s)

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
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'TimeTracking')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TimeTrackingApi#time_trackings_id_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update time tracking
    # 
    # @param id ID of time tracking
    # @param body 
    # @param [Hash] opts the optional parameters
    # @return [TimeTracking]
    def time_trackings_id_put(id, body, opts = {})
      data, status_code, headers = time_trackings_id_put_with_http_info(id, body, opts)
      return data
    end

    # Update time tracking
    # 
    # @param id ID of time tracking
    # @param body 
    # @param [Hash] opts the optional parameters
    # @return [Array<(TimeTracking, Fixnum, Hash)>] TimeTracking data, response status code and response headers
    def time_trackings_id_put_with_http_info(id, body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: TimeTrackingApi#time_trackings_id_put ..."
      end
      
      # verify the required parameter 'id' is set
      fail "Missing the required parameter 'id' when calling time_trackings_id_put" if id.nil?
      
      # verify the required parameter 'body' is set
      fail "Missing the required parameter 'body' when calling time_trackings_id_put" if body.nil?
      
      # resource path
      local_var_path = "/time-trackings/{id}".sub('{format}','json').sub('{' + 'id' + '}', id.to_s)

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
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'TimeTracking')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TimeTrackingApi#time_trackings_id_put\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Create time tracking
    # 
    # @param body 
    # @param [Hash] opts the optional parameters
    # @return [TimeTracking]
    def time_trackings_post(body, opts = {})
      data, status_code, headers = time_trackings_post_with_http_info(body, opts)
      return data
    end

    # Create time tracking
    # 
    # @param body 
    # @param [Hash] opts the optional parameters
    # @return [Array<(TimeTracking, Fixnum, Hash)>] TimeTracking data, response status code and response headers
    def time_trackings_post_with_http_info(body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: TimeTrackingApi#time_trackings_post ..."
      end
      
      # verify the required parameter 'body' is set
      fail "Missing the required parameter 'body' when calling time_trackings_post" if body.nil?
      
      # resource path
      local_var_path = "/time-trackings".sub('{format}','json')

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
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'TimeTracking')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TimeTrackingApi#time_trackings_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
