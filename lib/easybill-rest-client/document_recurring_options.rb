module EasybillRestClient
  class DocumentRecurringOptions < Dry::Types::Struct
    constructor_type :schema
    attribute :end_date_or_count, Types::Maybe::Strict::String
    attribute :frequency_special, Types::Maybe::Strict::String # TODO: enum
    attribute :frequency, Types::Maybe::Strict::String
    attribute :interval, Types::Maybe::Strict::Int
    attribute :is_draft, Types::Bool
    attribute :is_notify, Types::Bool
    attribute :is_paid, Types::Bool
    attribute :is_sepa, Types::Bool
    attribute :is_sign, Types::Bool
    attribute :next_date, Types::Date
    attribute :send_as, Types::Maybe::Strict::String # TODO: enum
    attribute :sepa_local_instrument, Types::Maybe::Strict::String # TODO: enum
    attribute :sepa_reference, Types::Maybe::Strict::String
    attribute :sepa_remittance_information, Types::Maybe::Strict::String
    attribute :sepa_sequence_type, Types::Maybe::Strict::String # TODO: enum
    attribute :status, Types::Maybe::Strict::String # TODO: enum
  end
end
