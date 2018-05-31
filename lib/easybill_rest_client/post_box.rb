# frozen_string_literal: true

module EasybillRestClient
  class PostBox
    include Virtus.model
    values do
      attribute :id, Integer
    end
    attribute :cc, String
    attribute :created_at, DateTime
    attribute :date, Date
    attribute :document_id, Integer
    attribute :from, String
    attribute :message, String
    attribute :processed_at, DateTime
    attribute :send_by_self, Boolean
    attribute :send_with_attachment, Boolean
    attribute :status_info, String
    attribute :status, String
    attribute :subject, String
    attribute :to, String
    attribute :type, String
  end
end
