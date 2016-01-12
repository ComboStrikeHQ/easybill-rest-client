require "uri"

module Easybill
  class DocumentApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end

    # Fetch documents list
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :type Filter documents by type. Multiple typs seperate with , like type=INVOICE,CREDIT.
    # @option opts [String] :is_draft Filter documents by draft flag.
    # @option opts [String] :customer_id Filter documents by customer_id. You can add multiple customer_is separate by comma like id,id,id.
    # @option opts [String] :document_date Filter documents by document_date. You can filter one date with document_date=2014-12-10 or between like 2015-01-01,2015-12-31.
    # @option opts [String] :number Filter documents by number.
    # @option opts [Integer] :page 
    # @option opts [Integer] :limit 
    # @return [Documents]
    def documents_get(opts = {})
      data, status_code, headers = documents_get_with_http_info(opts)
      return data
    end

    # Fetch documents list
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :type Filter documents by type. Multiple typs seperate with , like type=INVOICE,CREDIT.
    # @option opts [String] :is_draft Filter documents by draft flag.
    # @option opts [String] :customer_id Filter documents by customer_id. You can add multiple customer_is separate by comma like id,id,id.
    # @option opts [String] :document_date Filter documents by document_date. You can filter one date with document_date=2014-12-10 or between like 2015-01-01,2015-12-31.
    # @option opts [String] :number Filter documents by number.
    # @option opts [Integer] :page 
    # @option opts [Integer] :limit 
    # @return [Array<(Documents, Fixnum, Hash)>] Documents data, response status code and response headers
    def documents_get_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: DocumentApi#documents_get ..."
      end
      
      if opts[:'type'] && !['INVOICE', 'RECURRING', 'CREDIT', 'OFFER', 'REMINDER', 'DUNNING', 'STORNO', 'DELIVERY', 'PDF', 'CHARGE', 'CHARGE_CONFIRM', 'LETTER', 'ORDER'].include?(opts[:'type'])
        fail 'invalid value for "type", must be one of INVOICE, RECURRING, CREDIT, OFFER, REMINDER, DUNNING, STORNO, DELIVERY, PDF, CHARGE, CHARGE_CONFIRM, LETTER, ORDER'
      end
      
      if opts[:'is_draft'] && !['0', '1'].include?(opts[:'is_draft'])
        fail 'invalid value for "is_draft", must be one of 0, 1'
      end
      
      # resource path
      path = "/documents".sub('{format}','json')

      # query parameters
      query_params = {}
      query_params[:'type'] = opts[:'type'] if opts[:'type']
      query_params[:'is_draft'] = opts[:'is_draft'] if opts[:'is_draft']
      query_params[:'customer_id'] = opts[:'customer_id'] if opts[:'customer_id']
      query_params[:'document_date'] = opts[:'document_date'] if opts[:'document_date']
      query_params[:'number'] = opts[:'number'] if opts[:'number']
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
        :return_type => 'Documents')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: DocumentApi#documents_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Create document
    # 
    # @param body 
    # @param [Hash] opts the optional parameters
    # @return [Document]
    def documents_post(body, opts = {})
      data, status_code, headers = documents_post_with_http_info(body, opts)
      return data
    end

    # Create document
    # 
    # @param body 
    # @param [Hash] opts the optional parameters
    # @return [Array<(Document, Fixnum, Hash)>] Document data, response status code and response headers
    def documents_post_with_http_info(body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: DocumentApi#documents_post ..."
      end
      
      # verify the required parameter 'body' is set
      fail "Missing the required parameter 'body' when calling documents_post" if body.nil?
      
      # resource path
      path = "/documents".sub('{format}','json')

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
        :return_type => 'Document')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: DocumentApi#documents_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Fetch document
    # 
    # @param id ID of document
    # @param [Hash] opts the optional parameters
    # @return [Document]
    def documents_id_get(id, opts = {})
      data, status_code, headers = documents_id_get_with_http_info(id, opts)
      return data
    end

    # Fetch document
    # 
    # @param id ID of document
    # @param [Hash] opts the optional parameters
    # @return [Array<(Document, Fixnum, Hash)>] Document data, response status code and response headers
    def documents_id_get_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: DocumentApi#documents_id_get ..."
      end
      
      # verify the required parameter 'id' is set
      fail "Missing the required parameter 'id' when calling documents_id_get" if id.nil?
      
      # resource path
      path = "/documents/{id}".sub('{format}','json').sub('{' + 'id' + '}', id.to_s)

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
        :return_type => 'Document')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: DocumentApi#documents_id_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update document
    # 
    # @param id ID of document
    # @param body 
    # @param [Hash] opts the optional parameters
    # @return [Document]
    def documents_id_put(id, body, opts = {})
      data, status_code, headers = documents_id_put_with_http_info(id, body, opts)
      return data
    end

    # Update document
    # 
    # @param id ID of document
    # @param body 
    # @param [Hash] opts the optional parameters
    # @return [Array<(Document, Fixnum, Hash)>] Document data, response status code and response headers
    def documents_id_put_with_http_info(id, body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: DocumentApi#documents_id_put ..."
      end
      
      # verify the required parameter 'id' is set
      fail "Missing the required parameter 'id' when calling documents_id_put" if id.nil?
      
      # verify the required parameter 'body' is set
      fail "Missing the required parameter 'body' when calling documents_id_put" if body.nil?
      
      # resource path
      path = "/documents/{id}".sub('{format}','json').sub('{' + 'id' + '}', id.to_s)

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
        :return_type => 'Document')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: DocumentApi#documents_id_put\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Delete document
    # 
    # @param id ID of document
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def documents_id_delete(id, opts = {})
      documents_id_delete_with_http_info(id, opts)
      return nil
    end

    # Delete document
    # 
    # @param id ID of document
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def documents_id_delete_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: DocumentApi#documents_id_delete ..."
      end
      
      # verify the required parameter 'id' is set
      fail "Missing the required parameter 'id' when calling documents_id_delete" if id.nil?
      
      # resource path
      path = "/documents/{id}".sub('{format}','json').sub('{' + 'id' + '}', id.to_s)

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
        @api_client.config.logger.debug "API called: DocumentApi#documents_id_delete\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Cancel document
    # 
    # @param id ID of document
    # @param [Hash] opts the optional parameters
    # @return [Document]
    def documents_id_cancel_post(id, opts = {})
      data, status_code, headers = documents_id_cancel_post_with_http_info(id, opts)
      return data
    end

    # Cancel document
    # 
    # @param id ID of document
    # @param [Hash] opts the optional parameters
    # @return [Array<(Document, Fixnum, Hash)>] Document data, response status code and response headers
    def documents_id_cancel_post_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: DocumentApi#documents_id_cancel_post ..."
      end
      
      # verify the required parameter 'id' is set
      fail "Missing the required parameter 'id' when calling documents_id_cancel_post" if id.nil?
      
      # resource path
      path = "/documents/{id}/cancel".sub('{format}','json').sub('{' + 'id' + '}', id.to_s)

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
      data, status_code, headers = @api_client.call_api(:POST, path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'Document')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: DocumentApi#documents_id_cancel_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Mark document as done
    # 
    # @param id ID of document
    # @param [Hash] opts the optional parameters
    # @return [Document]
    def documents_id_done_put(id, opts = {})
      data, status_code, headers = documents_id_done_put_with_http_info(id, opts)
      return data
    end

    # Mark document as done
    # 
    # @param id ID of document
    # @param [Hash] opts the optional parameters
    # @return [Array<(Document, Fixnum, Hash)>] Document data, response status code and response headers
    def documents_id_done_put_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: DocumentApi#documents_id_done_put ..."
      end
      
      # verify the required parameter 'id' is set
      fail "Missing the required parameter 'id' when calling documents_id_done_put" if id.nil?
      
      # resource path
      path = "/documents/{id}/done".sub('{format}','json').sub('{' + 'id' + '}', id.to_s)

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
      data, status_code, headers = @api_client.call_api(:PUT, path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'Document')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: DocumentApi#documents_id_done_put\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Fetch pdf document
    # 
    # @param id ID of document
    # @param [Hash] opts the optional parameters
    # @return [File]
    def documents_id_pdf_get(id, opts = {})
      data, status_code, headers = documents_id_pdf_get_with_http_info(id, opts)
      return data
    end

    # Fetch pdf document
    # 
    # @param id ID of document
    # @param [Hash] opts the optional parameters
    # @return [Array<(File, Fixnum, Hash)>] File data, response status code and response headers
    def documents_id_pdf_get_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: DocumentApi#documents_id_pdf_get ..."
      end
      
      # verify the required parameter 'id' is set
      fail "Missing the required parameter 'id' when calling documents_id_pdf_get" if id.nil?
      
      # resource path
      path = "/documents/{id}/pdf".sub('{format}','json').sub('{' + 'id' + '}', id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      _header_accept = ['application/pdf']
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
        :return_type => 'File')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: DocumentApi#documents_id_pdf_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Send document
    # 
    # @param id ID of document
    # @param type 
    # @param body 
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def documents_id_send_type_post(id, type, body, opts = {})
      documents_id_send_type_post_with_http_info(id, type, body, opts)
      return nil
    end

    # Send document
    # 
    # @param id ID of document
    # @param type 
    # @param body 
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def documents_id_send_type_post_with_http_info(id, type, body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: DocumentApi#documents_id_send_type_post ..."
      end
      
      # verify the required parameter 'id' is set
      fail "Missing the required parameter 'id' when calling documents_id_send_type_post" if id.nil?
      
      # verify the required parameter 'type' is set
      fail "Missing the required parameter 'type' when calling documents_id_send_type_post" if type.nil?
      unless ['email', 'fax', 'post'].include?(type)
        fail "invalid value for 'type', must be one of email, fax, post"
      end
      
      # verify the required parameter 'body' is set
      fail "Missing the required parameter 'body' when calling documents_id_send_type_post" if body.nil?
      
      # resource path
      path = "/documents/{id}/send/{type}".sub('{format}','json').sub('{' + 'id' + '}', id.to_s).sub('{' + 'type' + '}', type.to_s)

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
        :auth_names => auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: DocumentApi#documents_id_send_type_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end




