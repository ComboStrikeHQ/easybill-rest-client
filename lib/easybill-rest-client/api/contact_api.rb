require "uri"

module Easybill
  class ContactApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end

    # Fetch customer contact list
    # 
    # @param customer_id ID of customer that needs to be fetched
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :page 
    # @return [Contacts]
    def customers_customer_id_contacts_get(customer_id, opts = {})
      data, status_code, headers = customers_customer_id_contacts_get_with_http_info(customer_id, opts)
      return data
    end

    # Fetch customer contact list
    # 
    # @param customer_id ID of customer that needs to be fetched
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :page 
    # @return [Array<(Contacts, Fixnum, Hash)>] Contacts data, response status code and response headers
    def customers_customer_id_contacts_get_with_http_info(customer_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: ContactApi#customers_customer_id_contacts_get ..."
      end
      
      # verify the required parameter 'customer_id' is set
      fail "Missing the required parameter 'customer_id' when calling customers_customer_id_contacts_get" if customer_id.nil?
      
      # resource path
      path = "/customers/{customerId}/contacts".sub('{format}','json').sub('{' + 'customerId' + '}', customer_id.to_s)

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
        :return_type => 'Contacts')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ContactApi#customers_customer_id_contacts_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Create new contact
    # 
    # @param customer_id ID of customer
    # @param [Hash] opts the optional parameters
    # @option opts [Contact] :body 
    # @return [Contact]
    def customers_customer_id_contacts_post(customer_id, opts = {})
      data, status_code, headers = customers_customer_id_contacts_post_with_http_info(customer_id, opts)
      return data
    end

    # Create new contact
    # 
    # @param customer_id ID of customer
    # @param [Hash] opts the optional parameters
    # @option opts [Contact] :body 
    # @return [Array<(Contact, Fixnum, Hash)>] Contact data, response status code and response headers
    def customers_customer_id_contacts_post_with_http_info(customer_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: ContactApi#customers_customer_id_contacts_post ..."
      end
      
      # verify the required parameter 'customer_id' is set
      fail "Missing the required parameter 'customer_id' when calling customers_customer_id_contacts_post" if customer_id.nil?
      
      # resource path
      path = "/customers/{customerId}/contacts".sub('{format}','json').sub('{' + 'customerId' + '}', customer_id.to_s)

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
      post_body = @api_client.object_to_http_body(opts[:'body'])
      

      auth_names = ['basicAuth']
      data, status_code, headers = @api_client.call_api(:POST, path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'Contact')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ContactApi#customers_customer_id_contacts_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Fetch contact
    # 
    # @param customer_id ID of customer
    # @param id ID of contact
    # @param [Hash] opts the optional parameters
    # @return [Contact]
    def customers_customer_id_contacts_id_get(customer_id, id, opts = {})
      data, status_code, headers = customers_customer_id_contacts_id_get_with_http_info(customer_id, id, opts)
      return data
    end

    # Fetch contact
    # 
    # @param customer_id ID of customer
    # @param id ID of contact
    # @param [Hash] opts the optional parameters
    # @return [Array<(Contact, Fixnum, Hash)>] Contact data, response status code and response headers
    def customers_customer_id_contacts_id_get_with_http_info(customer_id, id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: ContactApi#customers_customer_id_contacts_id_get ..."
      end
      
      # verify the required parameter 'customer_id' is set
      fail "Missing the required parameter 'customer_id' when calling customers_customer_id_contacts_id_get" if customer_id.nil?
      
      # verify the required parameter 'id' is set
      fail "Missing the required parameter 'id' when calling customers_customer_id_contacts_id_get" if id.nil?
      
      # resource path
      path = "/customers/{customerId}/contacts/{id}".sub('{format}','json').sub('{' + 'customerId' + '}', customer_id.to_s).sub('{' + 'id' + '}', id.to_s)

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
        :return_type => 'Contact')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ContactApi#customers_customer_id_contacts_id_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update Contact
    # 
    # @param customer_id ID of customer
    # @param id ID of contact
    # @param [Hash] opts the optional parameters
    # @option opts [Contact] :body 
    # @return [Contact]
    def customers_customer_id_contacts_id_put(customer_id, id, opts = {})
      data, status_code, headers = customers_customer_id_contacts_id_put_with_http_info(customer_id, id, opts)
      return data
    end

    # Update Contact
    # 
    # @param customer_id ID of customer
    # @param id ID of contact
    # @param [Hash] opts the optional parameters
    # @option opts [Contact] :body 
    # @return [Array<(Contact, Fixnum, Hash)>] Contact data, response status code and response headers
    def customers_customer_id_contacts_id_put_with_http_info(customer_id, id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: ContactApi#customers_customer_id_contacts_id_put ..."
      end
      
      # verify the required parameter 'customer_id' is set
      fail "Missing the required parameter 'customer_id' when calling customers_customer_id_contacts_id_put" if customer_id.nil?
      
      # verify the required parameter 'id' is set
      fail "Missing the required parameter 'id' when calling customers_customer_id_contacts_id_put" if id.nil?
      
      # resource path
      path = "/customers/{customerId}/contacts/{id}".sub('{format}','json').sub('{' + 'customerId' + '}', customer_id.to_s).sub('{' + 'id' + '}', id.to_s)

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
      post_body = @api_client.object_to_http_body(opts[:'body'])
      

      auth_names = ['basicAuth']
      data, status_code, headers = @api_client.call_api(:PUT, path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'Contact')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ContactApi#customers_customer_id_contacts_id_put\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Delete contact
    # 
    # @param customer_id ID of customer
    # @param id ID of contact
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def customers_customer_id_contacts_id_delete(customer_id, id, opts = {})
      customers_customer_id_contacts_id_delete_with_http_info(customer_id, id, opts)
      return nil
    end

    # Delete contact
    # 
    # @param customer_id ID of customer
    # @param id ID of contact
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def customers_customer_id_contacts_id_delete_with_http_info(customer_id, id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: ContactApi#customers_customer_id_contacts_id_delete ..."
      end
      
      # verify the required parameter 'customer_id' is set
      fail "Missing the required parameter 'customer_id' when calling customers_customer_id_contacts_id_delete" if customer_id.nil?
      
      # verify the required parameter 'id' is set
      fail "Missing the required parameter 'id' when calling customers_customer_id_contacts_id_delete" if id.nil?
      
      # resource path
      path = "/customers/{customerId}/contacts/{id}".sub('{format}','json').sub('{' + 'customerId' + '}', customer_id.to_s).sub('{' + 'id' + '}', id.to_s)

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
        @api_client.config.logger.debug "API called: ContactApi#customers_customer_id_contacts_id_delete\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end




