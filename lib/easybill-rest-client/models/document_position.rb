require 'date'

module Easybill
  class DocumentPosition
    attr_accessor :number

    attr_accessor :description

    attr_accessor :quantity

    attr_accessor :unit

    attr_accessor :type

    attr_accessor :position

    attr_accessor :single_price_net

    attr_accessor :single_price_gross

    attr_accessor :vat_percent

    attr_accessor :discount

    attr_accessor :discount_type

    attr_accessor :position_id

    attr_accessor :total_price_net

    attr_accessor :total_price_gross

    attr_accessor :total_vat

    attr_accessor :serial_number_id

    attr_accessor :serial_number

    attr_accessor :booking_account

    attr_accessor :export_cost_1

    attr_accessor :export_cost_2

    attr_accessor :cost_price_net

    attr_accessor :cost_price_total

    attr_accessor :cost_price_charge

    attr_accessor :cost_price_charge_type

    attr_accessor :id

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        
        :'number' => :'number',
        
        :'description' => :'description',
        
        :'quantity' => :'quantity',
        
        :'unit' => :'unit',
        
        :'type' => :'type',
        
        :'position' => :'position',
        
        :'single_price_net' => :'single_price_net',
        
        :'single_price_gross' => :'single_price_gross',
        
        :'vat_percent' => :'vat_percent',
        
        :'discount' => :'discount',
        
        :'discount_type' => :'discount_type',
        
        :'position_id' => :'position_id',
        
        :'total_price_net' => :'total_price_net',
        
        :'total_price_gross' => :'total_price_gross',
        
        :'total_vat' => :'total_vat',
        
        :'serial_number_id' => :'serial_number_id',
        
        :'serial_number' => :'serial_number',
        
        :'booking_account' => :'booking_account',
        
        :'export_cost_1' => :'export_cost_1',
        
        :'export_cost_2' => :'export_cost_2',
        
        :'cost_price_net' => :'cost_price_net',
        
        :'cost_price_total' => :'cost_price_total',
        
        :'cost_price_charge' => :'cost_price_charge',
        
        :'cost_price_charge_type' => :'cost_price_charge_type',
        
        :'id' => :'id'
        
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'number' => :'String',
        :'description' => :'String',
        :'quantity' => :'Float',
        :'unit' => :'String',
        :'type' => :'String',
        :'position' => :'Integer',
        :'single_price_net' => :'Float',
        :'single_price_gross' => :'Float',
        :'vat_percent' => :'Float',
        :'discount' => :'Float',
        :'discount_type' => :'String',
        :'position_id' => :'Integer',
        :'total_price_net' => :'Float',
        :'total_price_gross' => :'Float',
        :'total_vat' => :'Float',
        :'serial_number_id' => :'String',
        :'serial_number' => :'String',
        :'booking_account' => :'String',
        :'export_cost_1' => :'String',
        :'export_cost_2' => :'String',
        :'cost_price_net' => :'Float',
        :'cost_price_total' => :'Float',
        :'cost_price_charge' => :'Float',
        :'cost_price_charge_type' => :'String',
        :'id' => :'Integer'
        
      }
    end

    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}

      
      if attributes[:'number']
        self.number = attributes[:'number']
      end
      
      if attributes[:'description']
        self.description = attributes[:'description']
      end
      
      if attributes[:'quantity']
        self.quantity = attributes[:'quantity']
      end
      
      if attributes[:'unit']
        self.unit = attributes[:'unit']
      end
      
      if attributes[:'type']
        self.type = attributes[:'type']
      end
      
      if attributes[:'position']
        self.position = attributes[:'position']
      end
      
      if attributes[:'single_price_net']
        self.single_price_net = attributes[:'single_price_net']
      end
      
      if attributes[:'single_price_gross']
        self.single_price_gross = attributes[:'single_price_gross']
      end
      
      if attributes[:'vat_percent']
        self.vat_percent = attributes[:'vat_percent']
      end
      
      if attributes[:'discount']
        self.discount = attributes[:'discount']
      end
      
      if attributes[:'discount_type']
        self.discount_type = attributes[:'discount_type']
      end
      
      if attributes[:'position_id']
        self.position_id = attributes[:'position_id']
      end
      
      if attributes[:'total_price_net']
        self.total_price_net = attributes[:'total_price_net']
      end
      
      if attributes[:'total_price_gross']
        self.total_price_gross = attributes[:'total_price_gross']
      end
      
      if attributes[:'total_vat']
        self.total_vat = attributes[:'total_vat']
      end
      
      if attributes[:'serial_number_id']
        self.serial_number_id = attributes[:'serial_number_id']
      end
      
      if attributes[:'serial_number']
        self.serial_number = attributes[:'serial_number']
      end
      
      if attributes[:'booking_account']
        self.booking_account = attributes[:'booking_account']
      end
      
      if attributes[:'export_cost_1']
        self.export_cost_1 = attributes[:'export_cost_1']
      end
      
      if attributes[:'export_cost_2']
        self.export_cost_2 = attributes[:'export_cost_2']
      end
      
      if attributes[:'cost_price_net']
        self.cost_price_net = attributes[:'cost_price_net']
      end
      
      if attributes[:'cost_price_total']
        self.cost_price_total = attributes[:'cost_price_total']
      end
      
      if attributes[:'cost_price_charge']
        self.cost_price_charge = attributes[:'cost_price_charge']
      end
      
      if attributes[:'cost_price_charge_type']
        self.cost_price_charge_type = attributes[:'cost_price_charge_type']
      end
      
      if attributes[:'id']
        self.id = attributes[:'id']
      end
      
    end

    # Check equality by comparing each attribute.
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          number == o.number &&
          description == o.description &&
          quantity == o.quantity &&
          unit == o.unit &&
          type == o.type &&
          position == o.position &&
          single_price_net == o.single_price_net &&
          single_price_gross == o.single_price_gross &&
          vat_percent == o.vat_percent &&
          discount == o.discount &&
          discount_type == o.discount_type &&
          position_id == o.position_id &&
          total_price_net == o.total_price_net &&
          total_price_gross == o.total_price_gross &&
          total_vat == o.total_vat &&
          serial_number_id == o.serial_number_id &&
          serial_number == o.serial_number &&
          booking_account == o.booking_account &&
          export_cost_1 == o.export_cost_1 &&
          export_cost_2 == o.export_cost_2 &&
          cost_price_net == o.cost_price_net &&
          cost_price_total == o.cost_price_total &&
          cost_price_charge == o.cost_price_charge &&
          cost_price_charge_type == o.cost_price_charge_type &&
          id == o.id
    end

    # @see the `==` method
    def eql?(o)
      self == o
    end

    # Calculate hash code according to all attributes.
    def hash
      [number, description, quantity, unit, type, position, single_price_net, single_price_gross, vat_percent, discount, discount_type, position_id, total_price_net, total_price_gross, total_vat, serial_number_id, serial_number, booking_account, export_cost_1, export_cost_2, cost_price_net, cost_price_total, cost_price_charge, cost_price_charge_type, id].hash
    end

    # build the object from hash
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.swagger_types.each_pair do |key, type|
        if type =~ /^Array<(.*)>/i
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map{ |v| _deserialize($1, v) } )
          else
            #TODO show warning in debug mode
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        else
          # data not found in attributes(hash), not an issue as the data can be optional
        end
      end

      self
    end

    def _deserialize(type, value)
      # TODO: Workaround for faulty data we get from Easybill, find a nicer way
      # to deal with this.
      if type.to_sym == :Float && value == false
        return nil
      end

      case type.to_sym
      when :DateTime
        DateTime.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :BOOLEAN
        if value =~ /^(true|t|yes|y|1)$/i
          true
        else
          false
        end
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        _model = Easybill.const_get(type).new
        _model.build_from_hash(value)
      end
    end

    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_body (backward compatibility))
    def to_body
      to_hash
    end

    # return the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        next if value.nil?
        hash[param] = _to_hash(value)
      end
      hash
    end

    # Method to output non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map{ |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end

  end
end
