# frozen_string_literal: true
module EasybillRestClient
  class DocumentPayment
    include Virtus.model
    values do
      attribute :id, Integer
    end
    attribute :amount, Integer
    attribute :document_id, Integer
    attribute :notice, String
    attribute :payment_at, Date
    attribute :type, String
  end
end
