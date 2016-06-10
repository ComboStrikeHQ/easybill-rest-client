# frozen_string_literal: true
module EasybillRestClient
  class Pdf
    attr_reader :filename, :content

    def initialize(filename:, content:)
      @filename = filename
      @content = content
    end

    def empty?
      content.empty?
    end
  end
end
