require "uri"

module Easybill
  class ProjectApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end

    # Fetch projects list
    # 
    # @param [Hash] opts the optional parameters
    # @return [Projects]
    def projects_get(opts = {})
      data, status_code, headers = projects_get_with_http_info(opts)
      return data
    end

    # Fetch projects list
    # 
    # @param [Hash] opts the optional parameters
    # @return [Array<(Projects, Fixnum, Hash)>] Projects data, response status code and response headers
    def projects_get_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: ProjectApi#projects_get ..."
      end
      
      # resource path
      path = "/projects".sub('{format}','json')

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
        :return_type => 'Projects')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ProjectApi#projects_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Create project
    # 
    # @param body 
    # @param [Hash] opts the optional parameters
    # @return [Project]
    def projects_post(body, opts = {})
      data, status_code, headers = projects_post_with_http_info(body, opts)
      return data
    end

    # Create project
    # 
    # @param body 
    # @param [Hash] opts the optional parameters
    # @return [Array<(Project, Fixnum, Hash)>] Project data, response status code and response headers
    def projects_post_with_http_info(body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: ProjectApi#projects_post ..."
      end
      
      # verify the required parameter 'body' is set
      fail "Missing the required parameter 'body' when calling projects_post" if body.nil?
      
      # resource path
      path = "/projects".sub('{format}','json')

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
        :return_type => 'Project')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ProjectApi#projects_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Fetch project
    # 
    # @param id ID of project
    # @param [Hash] opts the optional parameters
    # @return [Project]
    def projects_id_get(id, opts = {})
      data, status_code, headers = projects_id_get_with_http_info(id, opts)
      return data
    end

    # Fetch project
    # 
    # @param id ID of project
    # @param [Hash] opts the optional parameters
    # @return [Array<(Project, Fixnum, Hash)>] Project data, response status code and response headers
    def projects_id_get_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: ProjectApi#projects_id_get ..."
      end
      
      # verify the required parameter 'id' is set
      fail "Missing the required parameter 'id' when calling projects_id_get" if id.nil?
      
      # resource path
      path = "/projects/{id}".sub('{format}','json').sub('{' + 'id' + '}', id.to_s)

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
      

      auth_names = []
      data, status_code, headers = @api_client.call_api(:GET, path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'Project')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ProjectApi#projects_id_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update project
    # 
    # @param id ID of project
    # @param body 
    # @param [Hash] opts the optional parameters
    # @return [Project]
    def projects_id_put(id, body, opts = {})
      data, status_code, headers = projects_id_put_with_http_info(id, body, opts)
      return data
    end

    # Update project
    # 
    # @param id ID of project
    # @param body 
    # @param [Hash] opts the optional parameters
    # @return [Array<(Project, Fixnum, Hash)>] Project data, response status code and response headers
    def projects_id_put_with_http_info(id, body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: ProjectApi#projects_id_put ..."
      end
      
      # verify the required parameter 'id' is set
      fail "Missing the required parameter 'id' when calling projects_id_put" if id.nil?
      
      # verify the required parameter 'body' is set
      fail "Missing the required parameter 'body' when calling projects_id_put" if body.nil?
      
      # resource path
      path = "/projects/{id}".sub('{format}','json').sub('{' + 'id' + '}', id.to_s)

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
      

      auth_names = []
      data, status_code, headers = @api_client.call_api(:PUT, path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'Project')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ProjectApi#projects_id_put\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Delete project
    # 
    # @param id ID of project
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def projects_id_delete(id, opts = {})
      projects_id_delete_with_http_info(id, opts)
      return nil
    end

    # Delete project
    # 
    # @param id ID of project
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def projects_id_delete_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: ProjectApi#projects_id_delete ..."
      end
      
      # verify the required parameter 'id' is set
      fail "Missing the required parameter 'id' when calling projects_id_delete" if id.nil?
      
      # resource path
      path = "/projects/{id}".sub('{format}','json').sub('{' + 'id' + '}', id.to_s)

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
      

      auth_names = []
      data, status_code, headers = @api_client.call_api(:DELETE, path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ProjectApi#projects_id_delete\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end




