require 'date'

module Easybill
  class DocumentPayment
    attr_accessor :amount

    attr_accessor :document_id

    attr_accessor :id

    attr_accessor :notice

    attr_accessor :payment_at

    attr_accessor :type

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        
        :'amount' => :'amount',
        
        :'document_id' => :'document_id',
        
        :'id' => :'id',
        
        :'notice' => :'notice',
        
        :'payment_at' => :'payment_at',
        
        :'type' => :'type'
        
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'amount' => :'String',
        :'document_id' => :'Integer',
        :'id' => :'Integer',
        :'notice' => :'String',
        :'payment_at' => :'String',
        :'type' => :'String'
        
      }
    end

    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}

      
      if attributes[:'amount']
        self.amount = attributes[:'amount']
      end
      
      if attributes[:'document_id']
        self.document_id = attributes[:'document_id']
      end
      
      if attributes[:'id']
        self.id = attributes[:'id']
      end
      
      if attributes[:'notice']
        self.notice = attributes[:'notice']
      end
      
      if attributes[:'payment_at']
        self.payment_at = attributes[:'payment_at']
      end
      
      if attributes[:'type']
        self.type = attributes[:'type']
      end
      
    end

    # Check equality by comparing each attribute.
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          amount == o.amount &&
          document_id == o.document_id &&
          id == o.id &&
          notice == o.notice &&
          payment_at == o.payment_at &&
          type == o.type
    end

    # @see the `==` method
    def eql?(o)
      self == o
    end

    # Calculate hash code according to all attributes.
    def hash
      [amount, document_id, id, notice, payment_at, type].hash
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
