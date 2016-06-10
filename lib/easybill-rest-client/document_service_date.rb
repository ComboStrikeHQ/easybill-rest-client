module EasybillRestClient
  class DocumentServiceDate
    include Virtus.model
    attribute :type, String # TODO: enum
    attribute :date, Date
    attribute :date_from, Date
    attribute :date_to, Date
    attribute :text, String
  end
end
