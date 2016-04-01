module EasybillRestClient
  class DocumentItem < Dry::Types::Struct
    constructor_type :schema
	  attribute :number, Types::Maybe::Strict::String
	  attribute :description, Types::Maybe::Strict::String
	  attribute :quantity, Types::Maybe::Strict::Int
	  attribute :unit, Types::Maybe::Strict::String
	  attribute :type, Types::Maybe::Strict::String # TODO: enum
	  attribute :position, Types::Maybe::Strict::Int
	  attribute :single_price_net, Types::Maybe::Strict::Int
	  attribute :single_price_gross, Types::Maybe::Coercible::Int # TODO: Should we round here?
	  attribute :vat_percent, Types::Maybe::Strict::Int
	  attribute :discount, Types::Maybe::Strict::Int
	  attribute :discount_type, Types::Maybe::Strict::String
	  attribute :position_id, Types::Maybe::Strict::Int
	  attribute :total_price_net, Types::Maybe::Strict::Int
	  attribute :total_price_gross, Types::Maybe::Coercible::Int # TODO: Should we round here?
	  attribute :total_vat, Types::Maybe::Coercible::Int
	  attribute :serial_number_id, Types::Maybe::Strict::String
	  attribute :serial_number, Types::Maybe::Strict::String
	  attribute :booking_account, Types::Maybe::Strict::String
	  attribute :export_cost_1, Types::Maybe::Strict::String
	  attribute :export_cost_2, Types::Maybe::Strict::String
	  attribute :cost_price_net, Types::Maybe::Strict::Int
	  attribute :cost_price_total, Types::Maybe::Strict::Int
	  attribute :cost_price_charge, Types::Maybe::Strict::Int
	  attribute :cost_price_charge_type, Types::Maybe::Strict::String
	  attribute :id, Types::Maybe::Strict::Int
  end
end
