module EasybillRestClient
  class DocumentAddress < Dry::Types::Struct
    constructor_type :schema
    attribute :salutation, Types::Maybe::Strict::String
    attribute :personal, Types::Bool
	  attribute :title, Types::Maybe::Strict::String
	  attribute :first_name, Types::Maybe::Strict::String
	  attribute :last_name, Types::Maybe::Strict::String
	  attribute :suffix_1, Types::Maybe::Strict::String
	  attribute :suffix_2, Types::Maybe::Strict::String
	  attribute :company_name, Types::Maybe::Strict::String
	  attribute :street, Types::Maybe::Strict::String
	  attribute :zip_code, Types::Maybe::Strict::String
	  attribute :city, Types::Maybe::Strict::String
	  attribute :country, Types::Maybe::Strict::String
  end
end
