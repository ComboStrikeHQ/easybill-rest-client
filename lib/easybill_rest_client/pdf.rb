# frozen_string_literal: true

module EasybillRestClient
  class Pdf
    attr_reader :content
    attr_writer :filename

    def initialize(filename:, content:)
      @filename = filename
      @content = content
    end

    def empty?
      content.empty?
    end

    def filename
      @filename[/\.pdf\Z/i] ? @filename : "#{@filename}.pdf"
    end
  end
end
