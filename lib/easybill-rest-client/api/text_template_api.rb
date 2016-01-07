require "uri"

module Easybill
  class TextTemplateApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end

    # Fetch text templates list
    # 
    # @param [Hash] opts the optional parameters
    # @return [TextTemplates]
    def text_templates_get(opts = {})
      data, status_code, headers = text_templates_get_with_http_info(opts)
      return data
    end

    # Fetch text templates list
    # 
    # @param [Hash] opts the optional parameters
    # @return [Array<(TextTemplates, Fixnum, Hash)>] TextTemplates data, response status code and response headers
    def text_templates_get_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: TextTemplateApi#text_templates_get ..."
      end
      
      # resource path
      path = "/text-templates".sub('{format}','json')

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
        :return_type => 'TextTemplates')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TextTemplateApi#text_templates_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Create text template
    # 
    # @param body 
    # @param [Hash] opts the optional parameters
    # @return [TextTemplate]
    def text_templates_post(body, opts = {})
      data, status_code, headers = text_templates_post_with_http_info(body, opts)
      return data
    end

    # Create text template
    # 
    # @param body 
    # @param [Hash] opts the optional parameters
    # @return [Array<(TextTemplate, Fixnum, Hash)>] TextTemplate data, response status code and response headers
    def text_templates_post_with_http_info(body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: TextTemplateApi#text_templates_post ..."
      end
      
      # verify the required parameter 'body' is set
      fail "Missing the required parameter 'body' when calling text_templates_post" if body.nil?
      
      # resource path
      path = "/text-templates".sub('{format}','json')

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
        :return_type => 'TextTemplate')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TextTemplateApi#text_templates_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Fetch text template
    # 
    # @param id ID of text template
    # @param [Hash] opts the optional parameters
    # @return [TextTemplate]
    def text_templates_id_get(id, opts = {})
      data, status_code, headers = text_templates_id_get_with_http_info(id, opts)
      return data
    end

    # Fetch text template
    # 
    # @param id ID of text template
    # @param [Hash] opts the optional parameters
    # @return [Array<(TextTemplate, Fixnum, Hash)>] TextTemplate data, response status code and response headers
    def text_templates_id_get_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: TextTemplateApi#text_templates_id_get ..."
      end
      
      # verify the required parameter 'id' is set
      fail "Missing the required parameter 'id' when calling text_templates_id_get" if id.nil?
      
      # resource path
      path = "/text-templates/{id}".sub('{format}','json').sub('{' + 'id' + '}', id.to_s)

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
        :return_type => 'TextTemplate')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TextTemplateApi#text_templates_id_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update text template
    # 
    # @param id ID of text template
    # @param body 
    # @param [Hash] opts the optional parameters
    # @return [TextTemplate]
    def text_templates_id_put(id, body, opts = {})
      data, status_code, headers = text_templates_id_put_with_http_info(id, body, opts)
      return data
    end

    # Update text template
    # 
    # @param id ID of text template
    # @param body 
    # @param [Hash] opts the optional parameters
    # @return [Array<(TextTemplate, Fixnum, Hash)>] TextTemplate data, response status code and response headers
    def text_templates_id_put_with_http_info(id, body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: TextTemplateApi#text_templates_id_put ..."
      end
      
      # verify the required parameter 'id' is set
      fail "Missing the required parameter 'id' when calling text_templates_id_put" if id.nil?
      
      # verify the required parameter 'body' is set
      fail "Missing the required parameter 'body' when calling text_templates_id_put" if body.nil?
      
      # resource path
      path = "/text-templates/{id}".sub('{format}','json').sub('{' + 'id' + '}', id.to_s)

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
        :return_type => 'TextTemplate')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TextTemplateApi#text_templates_id_put\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Delete text template
    # 
    # @param id ID of text template
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def text_templates_id_delete(id, opts = {})
      text_templates_id_delete_with_http_info(id, opts)
      return nil
    end

    # Delete text template
    # 
    # @param id ID of text template
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def text_templates_id_delete_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: TextTemplateApi#text_templates_id_delete ..."
      end
      
      # verify the required parameter 'id' is set
      fail "Missing the required parameter 'id' when calling text_templates_id_delete" if id.nil?
      
      # resource path
      path = "/text-templates/{id}".sub('{format}','json').sub('{' + 'id' + '}', id.to_s)

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
        @api_client.config.logger.debug "API called: TextTemplateApi#text_templates_id_delete\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end




