module EasybillRestClient
  class DocumentServiceDate < Dry::Types::Struct
    constructor_type :schema
    attribute :type, Types::Maybe::Strict::String # TODO: enum
    attribute :date, Types::Maybe::Strict::Date
    attribute :date_from, Types::Maybe::Strict::Date
    attribute :date_to, Types::Maybe::Strict::Date
    attribute :text, Types::Maybe::Strict::String
  end
end
