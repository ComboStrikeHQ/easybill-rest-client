module EasybillRestClient
  class DocumentRecurringOptions
    include Virtus.model
    attribute :end_date_or_count, String
    attribute :frequency_special, String # TODO: enum
    attribute :frequency, String
    attribute :interval, Integer
    attribute :is_draft, Boolean
    attribute :is_notify, Boolean
    attribute :is_paid, Boolean
    attribute :is_sepa, Boolean
    attribute :is_sign, Boolean
    attribute :next_date, Date
    attribute :send_as, String # TODO: enum
    attribute :sepa_local_instrument, String # TODO: enum
    attribute :sepa_reference, String
    attribute :sepa_remittance_information, String
    attribute :sepa_sequence_type, String # TODO: enum
    attribute :status, String # TODO: enum
  end
end
