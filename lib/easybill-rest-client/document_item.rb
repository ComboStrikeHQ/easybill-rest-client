# frozen_string_literal: true
module EasybillRestClient
  class DocumentItem
    include Virtus.model
    attribute :number, String
    attribute :description, String
    attribute :quantity, Integer
    attribute :unit, String
    attribute :type, String # TODO: enum
    attribute :position, Integer
    attribute :single_price_net, Float
    attribute :single_price_gross, Float # TODO: Should we round here?
    attribute :vat_percent, Integer
    attribute :discount, Integer
    attribute :discount_type, String
    attribute :position_id, Integer
    attribute :total_price_net, Float
    attribute :total_price_gross, Float # TODO: Should we round here?
    attribute :total_vat, Integer
    attribute :serial_number_id, String
    attribute :serial_number, String
    attribute :booking_account, String
    attribute :export_cost_1, String
    attribute :export_cost_2, String
    attribute :cost_price_net, Integer
    attribute :cost_price_total, Integer
    attribute :cost_price_charge, Integer
    attribute :cost_price_charge_type, String
    attribute :id, Integer
  end
end
