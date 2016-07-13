# frozen_string_literal: true
module EasybillRestClient
  class Document
    include Virtus.model
    values do
      attribute :id, Integer
    end
    attribute :address, DocumentAddress
    attribute :amount_net, Integer
    attribute :amount, Integer
    attribute :bank_debit_form, String
    attribute :cancel_id, Integer
    attribute :cash_allowance_days, Integer
    attribute :cash_allowance, String
    attribute :cash_allowance_text, String
    attribute :contact_id, Integer
    attribute :contact_label, String
    attribute :contact_text, String
    attribute :created_at, DateTime
    attribute :currency, String
    attribute :customer_id, Integer
    attribute :discount, String
    attribute :discount_type, String
    attribute :document_date, Date
    attribute :due_date, Date
    attribute :edited_at, String
    attribute :grace_period, Integer
    attribute :is_archive, Boolean
    attribute :is_draft, Boolean
    attribute :items, [DocumentItem]
    attribute :label_address, DocumentAddress
    attribute :number, String
    attribute :paid_amount, Integer
    attribute :paid_at, Date
    attribute :pdf_pages, Integer
    attribute :pdf_template, String
    attribute :project_id, String
    attribute :recurring_options, DocumentRecurringOptions
    attribute :ref_id, Integer
    attribute :service_date, DocumentServiceDate
    attribute :status, String # TODO: enum
    attribute :text_prefix, String
    attribute :text, String
    attribute :title, String
    attribute :type, String # .enum(
    #   'INVOICE', 'RECURRING', 'CREDIT', 'OFFER', 'REMINDER', 'DUNNING',
    #   'STORNO', 'DELIVERY', 'CHARGE', 'CHARGE_CONFIRM', 'LETTER', 'ORDER'
    # )
    attribute :use_shipping_address, Boolean
    attribute :vat_option, String
  end
end
