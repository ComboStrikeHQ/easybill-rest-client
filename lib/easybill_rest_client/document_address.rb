# frozen_string_literal: true

module EasybillRestClient
  class DocumentAddress
    include Virtus.model
    attribute :salutation, String
    attribute :personal, Boolean
    attribute :title, String
    attribute :first_name, String
    attribute :last_name, String
    attribute :suffix_1, String
    attribute :suffix_2, String
    attribute :company_name, String
    attribute :street, String
    attribute :zip_code, String
    attribute :city, String
    attribute :country, String
  end
end
