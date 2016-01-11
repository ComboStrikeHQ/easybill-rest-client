require "uri"

module Easybill
  class AttachmentApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end

    # Fetch attachments list
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :page 
    # @option opts [Integer] :limit 
    # @return [Attachments]
    def attachments_get(opts = {})
      data, status_code, headers = attachments_get_with_http_info(opts)
      return data
    end

    # Fetch attachments list
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :page 
    # @option opts [Integer] :limit 
    # @return [Array<(Attachments, Fixnum, Hash)>] Attachments data, response status code and response headers
    def attachments_get_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: AttachmentApi#attachments_get ..."
      end
      
      # resource path
      path = "/attachments".sub('{format}','json')

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
        :return_type => 'Attachments')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: AttachmentApi#attachments_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Create attachment
    # 
    # @param file 
    # @param [Hash] opts the optional parameters
    # @return [Attachment]
    def attachments_post(file, opts = {})
      data, status_code, headers = attachments_post_with_http_info(file, opts)
      return data
    end

    # Create attachment
    # 
    # @param file 
    # @param [Hash] opts the optional parameters
    # @return [Array<(Attachment, Fixnum, Hash)>] Attachment data, response status code and response headers
    def attachments_post_with_http_info(file, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: AttachmentApi#attachments_post ..."
      end
      
      # verify the required parameter 'file' is set
      fail "Missing the required parameter 'file' when calling attachments_post" if file.nil?
      
      # resource path
      path = "/attachments".sub('{format}','json')

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      _header_accept = ['application/json']
      _header_accept_result = @api_client.select_header_accept(_header_accept) and header_params['Accept'] = _header_accept_result

      # HTTP header 'Content-Type'
      _header_content_type = ['multipart/form-data']
      header_params['Content-Type'] = @api_client.select_header_content_type(_header_content_type)

      # form parameters
      form_params = {}
      form_params["file"] = file

      # http body (model)
      post_body = nil
      

      auth_names = ['basicAuth']
      data, status_code, headers = @api_client.call_api(:POST, path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'Attachment')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: AttachmentApi#attachments_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Fetch attachment
    # 
    # @param id ID of attachment
    # @param [Hash] opts the optional parameters
    # @return [Attachment]
    def attachments_id_get(id, opts = {})
      data, status_code, headers = attachments_id_get_with_http_info(id, opts)
      return data
    end

    # Fetch attachment
    # 
    # @param id ID of attachment
    # @param [Hash] opts the optional parameters
    # @return [Array<(Attachment, Fixnum, Hash)>] Attachment data, response status code and response headers
    def attachments_id_get_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: AttachmentApi#attachments_id_get ..."
      end
      
      # verify the required parameter 'id' is set
      fail "Missing the required parameter 'id' when calling attachments_id_get" if id.nil?
      
      # resource path
      path = "/attachments/{id}".sub('{format}','json').sub('{' + 'id' + '}', id.to_s)

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
        :return_type => 'Attachment')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: AttachmentApi#attachments_id_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update attachment
    # 
    # @param id ID of attachment
    # @param body 
    # @param [Hash] opts the optional parameters
    # @return [Attachment]
    def attachments_id_put(id, body, opts = {})
      data, status_code, headers = attachments_id_put_with_http_info(id, body, opts)
      return data
    end

    # Update attachment
    # 
    # @param id ID of attachment
    # @param body 
    # @param [Hash] opts the optional parameters
    # @return [Array<(Attachment, Fixnum, Hash)>] Attachment data, response status code and response headers
    def attachments_id_put_with_http_info(id, body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: AttachmentApi#attachments_id_put ..."
      end
      
      # verify the required parameter 'id' is set
      fail "Missing the required parameter 'id' when calling attachments_id_put" if id.nil?
      
      # verify the required parameter 'body' is set
      fail "Missing the required parameter 'body' when calling attachments_id_put" if body.nil?
      
      # resource path
      path = "/attachments/{id}".sub('{format}','json').sub('{' + 'id' + '}', id.to_s)

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
        :return_type => 'Attachment')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: AttachmentApi#attachments_id_put\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Delete attachment
    # 
    # @param id ID of attachment
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def attachments_id_delete(id, opts = {})
      attachments_id_delete_with_http_info(id, opts)
      return nil
    end

    # Delete attachment
    # 
    # @param id ID of attachment
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def attachments_id_delete_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: AttachmentApi#attachments_id_delete ..."
      end
      
      # verify the required parameter 'id' is set
      fail "Missing the required parameter 'id' when calling attachments_id_delete" if id.nil?
      
      # resource path
      path = "/attachments/{id}".sub('{format}','json').sub('{' + 'id' + '}', id.to_s)

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
        @api_client.config.logger.debug "API called: AttachmentApi#attachments_id_delete\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Fetch attachment content
    # 
    # @param id ID of attachment
    # @param [Hash] opts the optional parameters
    # @return [binary]
    def attachments_id_content_get(id, opts = {})
      data, status_code, headers = attachments_id_content_get_with_http_info(id, opts)
      return data
    end

    # Fetch attachment content
    # 
    # @param id ID of attachment
    # @param [Hash] opts the optional parameters
    # @return [Array<(binary, Fixnum, Hash)>] binary data, response status code and response headers
    def attachments_id_content_get_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: AttachmentApi#attachments_id_content_get ..."
      end
      
      # verify the required parameter 'id' is set
      fail "Missing the required parameter 'id' when calling attachments_id_content_get" if id.nil?
      
      # resource path
      path = "/attachments/{id}/content".sub('{format}','json').sub('{' + 'id' + '}', id.to_s)

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
        :return_type => 'binary')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: AttachmentApi#attachments_id_content_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end




