require 'date'

module Easybill
  class Position
    attr_accessor :id

    attr_accessor :type

    # Only by TEXT
    attr_accessor :title

    # Only by SERVICE and PRODUCT
    attr_accessor :number

    attr_accessor :description

    attr_accessor :note

    attr_accessor :unit

    attr_accessor :export_identifier

    attr_accessor :price_type

    attr_accessor :vat_percent

    attr_accessor :sale_price

    attr_accessor :sale_price2

    attr_accessor :sale_price3

    attr_accessor :sale_price4

    attr_accessor :sale_price5

    attr_accessor :sale_price6

    attr_accessor :sale_price7

    attr_accessor :sale_price8

    attr_accessor :sale_price9

    attr_accessor :sale_price10

    attr_accessor :export_cost1

    attr_accessor :export_cost2

    attr_accessor :group_id

    attr_accessor :stock

    attr_accessor :stock_count

    attr_accessor :stock_limit_notify

    attr_accessor :stock_limit

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        
        :'id' => :'id',
        
        :'type' => :'type',
        
        :'title' => :'title',
        
        :'number' => :'number',
        
        :'description' => :'description',
        
        :'note' => :'note',
        
        :'unit' => :'unit',
        
        :'export_identifier' => :'export_identifier',
        
        :'price_type' => :'price_type',
        
        :'vat_percent' => :'vat_percent',
        
        :'sale_price' => :'sale_price',
        
        :'sale_price2' => :'sale_price2',
        
        :'sale_price3' => :'sale_price3',
        
        :'sale_price4' => :'sale_price4',
        
        :'sale_price5' => :'sale_price5',
        
        :'sale_price6' => :'sale_price6',
        
        :'sale_price7' => :'sale_price7',
        
        :'sale_price8' => :'sale_price8',
        
        :'sale_price9' => :'sale_price9',
        
        :'sale_price10' => :'sale_price10',
        
        :'export_cost1' => :'export_cost1',
        
        :'export_cost2' => :'export_cost2',
        
        :'group_id' => :'group_id',
        
        :'stock' => :'stock',
        
        :'stock_count' => :'stock_count',
        
        :'stock_limit_notify' => :'stock_limit_notify',
        
        :'stock_limit' => :'stock_limit'
        
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'id' => :'Integer',
        :'type' => :'String',
        :'title' => :'String',
        :'number' => :'String',
        :'description' => :'String',
        :'note' => :'String',
        :'unit' => :'String',
        :'export_identifier' => :'String',
        :'price_type' => :'String',
        :'vat_percent' => :'Float',
        :'sale_price' => :'Float',
        :'sale_price2' => :'Float',
        :'sale_price3' => :'Float',
        :'sale_price4' => :'Float',
        :'sale_price5' => :'Float',
        :'sale_price6' => :'Float',
        :'sale_price7' => :'Float',
        :'sale_price8' => :'Float',
        :'sale_price9' => :'Float',
        :'sale_price10' => :'Float',
        :'export_cost1' => :'String',
        :'export_cost2' => :'String',
        :'group_id' => :'Integer',
        :'stock' => :'String',
        :'stock_count' => :'String',
        :'stock_limit_notify' => :'String',
        :'stock_limit' => :'String'
        
      }
    end

    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}

      
      if attributes[:'id']
        self.id = attributes[:'id']
      end
      
      if attributes[:'type']
        self.type = attributes[:'type']
      end
      
      if attributes[:'title']
        self.title = attributes[:'title']
      end
      
      if attributes[:'number']
        self.number = attributes[:'number']
      end
      
      if attributes[:'description']
        self.description = attributes[:'description']
      end
      
      if attributes[:'note']
        self.note = attributes[:'note']
      end
      
      if attributes[:'unit']
        self.unit = attributes[:'unit']
      end
      
      if attributes[:'export_identifier']
        self.export_identifier = attributes[:'export_identifier']
      end
      
      if attributes[:'price_type']
        self.price_type = attributes[:'price_type']
      end
      
      if attributes[:'vat_percent']
        self.vat_percent = attributes[:'vat_percent']
      end
      
      if attributes[:'sale_price']
        self.sale_price = attributes[:'sale_price']
      end
      
      if attributes[:'sale_price2']
        self.sale_price2 = attributes[:'sale_price2']
      end
      
      if attributes[:'sale_price3']
        self.sale_price3 = attributes[:'sale_price3']
      end
      
      if attributes[:'sale_price4']
        self.sale_price4 = attributes[:'sale_price4']
      end
      
      if attributes[:'sale_price5']
        self.sale_price5 = attributes[:'sale_price5']
      end
      
      if attributes[:'sale_price6']
        self.sale_price6 = attributes[:'sale_price6']
      end
      
      if attributes[:'sale_price7']
        self.sale_price7 = attributes[:'sale_price7']
      end
      
      if attributes[:'sale_price8']
        self.sale_price8 = attributes[:'sale_price8']
      end
      
      if attributes[:'sale_price9']
        self.sale_price9 = attributes[:'sale_price9']
      end
      
      if attributes[:'sale_price10']
        self.sale_price10 = attributes[:'sale_price10']
      end
      
      if attributes[:'export_cost1']
        self.export_cost1 = attributes[:'export_cost1']
      end
      
      if attributes[:'export_cost2']
        self.export_cost2 = attributes[:'export_cost2']
      end
      
      if attributes[:'group_id']
        self.group_id = attributes[:'group_id']
      end
      
      if attributes[:'stock']
        self.stock = attributes[:'stock']
      end
      
      if attributes[:'stock_count']
        self.stock_count = attributes[:'stock_count']
      end
      
      if attributes[:'stock_limit_notify']
        self.stock_limit_notify = attributes[:'stock_limit_notify']
      end
      
      if attributes[:'stock_limit']
        self.stock_limit = attributes[:'stock_limit']
      end
      
    end

    # Custom attribute writer method checking allowed values (enum).
    def type=(type)
      allowed_values = ["TEXT", "PRODUCT", "SERVICE"]
      if type && !allowed_values.include?(type)
        fail "invalid value for 'type', must be one of #{allowed_values}"
      end
      @type = type
    end

    # Check equality by comparing each attribute.
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          id == o.id &&
          type == o.type &&
          title == o.title &&
          number == o.number &&
          description == o.description &&
          note == o.note &&
          unit == o.unit &&
          export_identifier == o.export_identifier &&
          price_type == o.price_type &&
          vat_percent == o.vat_percent &&
          sale_price == o.sale_price &&
          sale_price2 == o.sale_price2 &&
          sale_price3 == o.sale_price3 &&
          sale_price4 == o.sale_price4 &&
          sale_price5 == o.sale_price5 &&
          sale_price6 == o.sale_price6 &&
          sale_price7 == o.sale_price7 &&
          sale_price8 == o.sale_price8 &&
          sale_price9 == o.sale_price9 &&
          sale_price10 == o.sale_price10 &&
          export_cost1 == o.export_cost1 &&
          export_cost2 == o.export_cost2 &&
          group_id == o.group_id &&
          stock == o.stock &&
          stock_count == o.stock_count &&
          stock_limit_notify == o.stock_limit_notify &&
          stock_limit == o.stock_limit
    end

    # @see the `==` method
    def eql?(o)
      self == o
    end

    # Calculate hash code according to all attributes.
    def hash
      [id, type, title, number, description, note, unit, export_identifier, price_type, vat_percent, sale_price, sale_price2, sale_price3, sale_price4, sale_price5, sale_price6, sale_price7, sale_price8, sale_price9, sale_price10, export_cost1, export_cost2, group_id, stock, stock_count, stock_limit_notify, stock_limit].hash
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
