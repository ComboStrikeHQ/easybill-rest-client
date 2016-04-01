module EasybillRestClient
  class Document < Dry::Types::Struct
    constructor_type :schema
    attribute :address, DocumentAddress
    attribute :amount_net, Types::Maybe::Strict::Int
    attribute :amount, Types::Maybe::Strict::Int
    attribute :bank_debit_form, Types::Maybe::Strict::String
    attribute :cancel_id, Types::Maybe::Strict::Int
    attribute :cash_allowance_days, Types::Maybe::Strict::String
    attribute :cash_allowance, Types::Maybe::Strict::String
    attribute :cash_allowance_text, Types::String
    attribute :contact_id, Types::Maybe::Strict::Int
    attribute :contact_label, Types::Maybe::Strict::String
    attribute :contact_text, Types::Maybe::Strict::String
    attribute :created_at, Types::Maybe::Strict::DateTime
    attribute :currency, Types::Maybe::Strict::String
    attribute :customer_id, Types::Maybe::Strict::Int
    attribute :discount, Types::Maybe::Strict::String
    attribute :discount_type, Types::Maybe::Strict::String
    attribute :document_date, Types::Maybe::Strict::Date
    attribute :due_date, Types::Maybe::Strict::Date
    attribute :edited_at, Types::Maybe::Strict::String
    attribute :grace_period, Types::Maybe::Strict::Int
    attribute :id, Types::Maybe::Strict::Int
    attribute :is_archive, Types::Bool
    attribute :is_draft, Types::Bool
    attribute :items, Types::Strict::Array.member(DocumentItem)
    attribute :label_address, DocumentAddress
    attribute :number, Types::Maybe::Strict::String
    attribute :paid_amount, Types::Maybe::Strict::Int
    attribute :paid_at, Types::Maybe::Strict::Date
    attribute :pdf_pages, Types::Maybe::Strict::Int
    attribute :pdf_template, Types::Maybe::Strict::String
    attribute :project_id, Types::Maybe::Strict::String
    # attribute :recurring_options, DocumentRecurringOptions
    attribute :ref_id, Types::Maybe::Strict::Int
    attribute :service_date, DocumentServiceDate
    attribute :status, Types::Maybe::Strict::String # TODO: enum
    attribute :text_prefix, Types::Maybe::Strict::String
    attribute :text, Types::Maybe::Strict::String
    attribute :title, Types::Maybe::Strict::String
    attribute :type, Types::Maybe::Strict::String.enum(
      'INVOICE', 'RECURRING', 'CREDIT', 'OFFER', 'REMINDER', 'DUNNING',
      'STORNO', 'DELIVERY', 'CHARGE', 'CHARGE_CONFIRM', 'LETTER', 'ORDER'
    )
    attribute :use_shipping_address, Types::Bool
    attribute :vat_option, Types::Maybe::Strict::String
  end
end
