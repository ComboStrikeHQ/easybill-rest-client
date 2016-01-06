require 'date'

module Easybill
  class DocumentAddress
    attr_accessor :salutation

    attr_accessor :personal

    attr_accessor :title

    attr_accessor :first_name

    attr_accessor :last_name

    attr_accessor :suffix1

    attr_accessor :suffix2

    attr_accessor :company_name

    attr_accessor :street

    attr_accessor :zip_code

    attr_accessor :city

    attr_accessor :country

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        
        :'salutation' => :'salutation',
        
        :'personal' => :'personal',
        
        :'title' => :'title',
        
        :'first_name' => :'first_name',
        
        :'last_name' => :'last_name',
        
        :'suffix1' => :'suffix1',
        
        :'suffix2' => :'suffix2',
        
        :'company_name' => :'company_name',
        
        :'street' => :'street',
        
        :'zip_code' => :'zip_code',
        
        :'city' => :'city',
        
        :'country' => :'country'
        
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'salutation' => :'String',
        :'personal' => :'String',
        :'title' => :'String',
        :'first_name' => :'String',
        :'last_name' => :'String',
        :'suffix1' => :'String',
        :'suffix2' => :'String',
        :'company_name' => :'String',
        :'street' => :'String',
        :'zip_code' => :'String',
        :'city' => :'String',
        :'country' => :'String'
        
      }
    end

    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}

      
      if attributes[:'salutation']
        self.salutation = attributes[:'salutation']
      end
      
      if attributes[:'personal']
        self.personal = attributes[:'personal']
      end
      
      if attributes[:'title']
        self.title = attributes[:'title']
      end
      
      if attributes[:'first_name']
        self.first_name = attributes[:'first_name']
      end
      
      if attributes[:'last_name']
        self.last_name = attributes[:'last_name']
      end
      
      if attributes[:'suffix1']
        self.suffix1 = attributes[:'suffix1']
      end
      
      if attributes[:'suffix2']
        self.suffix2 = attributes[:'suffix2']
      end
      
      if attributes[:'company_name']
        self.company_name = attributes[:'company_name']
      end
      
      if attributes[:'street']
        self.street = attributes[:'street']
      end
      
      if attributes[:'zip_code']
        self.zip_code = attributes[:'zip_code']
      end
      
      if attributes[:'city']
        self.city = attributes[:'city']
      end
      
      if attributes[:'country']
        self.country = attributes[:'country']
      end
      
    end

    # Check equality by comparing each attribute.
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          salutation == o.salutation &&
          personal == o.personal &&
          title == o.title &&
          first_name == o.first_name &&
          last_name == o.last_name &&
          suffix1 == o.suffix1 &&
          suffix2 == o.suffix2 &&
          company_name == o.company_name &&
          street == o.street &&
          zip_code == o.zip_code &&
          city == o.city &&
          country == o.country
    end

    # @see the `==` method
    def eql?(o)
      self == o
    end

    # Calculate hash code according to all attributes.
    def hash
      [salutation, personal, title, first_name, last_name, suffix1, suffix2, company_name, street, zip_code, city, country].hash
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
