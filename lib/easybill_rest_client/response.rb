# frozen_string_literal: true
module EasybillRestClient
  class Response
    def initialize(response)
      raise TooManyRequests if response.is_a?(Net::HTTPTooManyRequests)
      @response = response
    end

    def body
      body = extract_response_body(response)
      unless response.is_a?(Net::HTTPSuccess)
        message = body.is_a?(Hash) ? body[:message] : body
        raise ApiError, message
      end
      body && !body.empty? ? body : nil
    end

    private

    attr_reader :response

    def extract_response_body(response)
      return unless response.class.body_permitted?
      case response.content_type
      when 'application/json'
        JSON.parse(response.body, symbolize_names: true)
      when 'application/pdf'
        /\Wfilename="(?<filename>.*?)"/ =~ response.fetch('content-disposition')
        Pdf.new(filename: filename, content: response.body)
      else
        response.body
      end
    end
  end
end
