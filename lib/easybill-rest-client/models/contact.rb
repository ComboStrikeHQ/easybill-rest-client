require 'date'

module Easybill
  class Contact
    attr_accessor :city

    attr_accessor :country

    attr_accessor :emails

    attr_accessor :fax

    attr_accessor :first_name

    attr_accessor :id

    attr_accessor :last_name

    attr_accessor :mobile

    attr_accessor :note

    attr_accessor :personal

    attr_accessor :phone_1

    attr_accessor :phone_2

    attr_accessor :salutation

    attr_accessor :street

    attr_accessor :suffix_1

    attr_accessor :suffix_2

    attr_accessor :title

    attr_accessor :zip_code

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        
        :'city' => :'city',
        
        :'country' => :'country',
        
        :'emails' => :'emails',
        
        :'fax' => :'fax',
        
        :'first_name' => :'first_name',
        
        :'id' => :'id',
        
        :'last_name' => :'last_name',
        
        :'mobile' => :'mobile',
        
        :'note' => :'note',
        
        :'personal' => :'personal',
        
        :'phone_1' => :'phone_1',
        
        :'phone_2' => :'phone_2',
        
        :'salutation' => :'salutation',
        
        :'street' => :'street',
        
        :'suffix_1' => :'suffix_1',
        
        :'suffix_2' => :'suffix_2',
        
        :'title' => :'title',
        
        :'zip_code' => :'zip_code'
        
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'city' => :'String',
        :'country' => :'String',
        :'emails' => :'Array<String>',
        :'fax' => :'String',
        :'first_name' => :'String',
        :'id' => :'Integer',
        :'last_name' => :'String',
        :'mobile' => :'String',
        :'note' => :'String',
        :'personal' => :'String',
        :'phone_1' => :'String',
        :'phone_2' => :'String',
        :'salutation' => :'String',
        :'street' => :'String',
        :'suffix_1' => :'String',
        :'suffix_2' => :'String',
        :'title' => :'String',
        :'zip_code' => :'String'
        
      }
    end

    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}

      
      if attributes[:'city']
        self.city = attributes[:'city']
      end
      
      if attributes[:'country']
        self.country = attributes[:'country']
      end
      
      if attributes[:'emails']
        if (value = attributes[:'emails']).is_a?(Array)
          self.emails = value
        end
      end
      
      if attributes[:'fax']
        self.fax = attributes[:'fax']
      end
      
      if attributes[:'first_name']
        self.first_name = attributes[:'first_name']
      end
      
      if attributes[:'id']
        self.id = attributes[:'id']
      end
      
      if attributes[:'last_name']
        self.last_name = attributes[:'last_name']
      end
      
      if attributes[:'mobile']
        self.mobile = attributes[:'mobile']
      end
      
      if attributes[:'note']
        self.note = attributes[:'note']
      end
      
      if attributes[:'personal']
        self.personal = attributes[:'personal']
      end
      
      if attributes[:'phone_1']
        self.phone_1 = attributes[:'phone_1']
      end
      
      if attributes[:'phone_2']
        self.phone_2 = attributes[:'phone_2']
      end
      
      if attributes[:'salutation']
        self.salutation = attributes[:'salutation']
      end
      
      if attributes[:'street']
        self.street = attributes[:'street']
      end
      
      if attributes[:'suffix_1']
        self.suffix_1 = attributes[:'suffix_1']
      end
      
      if attributes[:'suffix_2']
        self.suffix_2 = attributes[:'suffix_2']
      end
      
      if attributes[:'title']
        self.title = attributes[:'title']
      end
      
      if attributes[:'zip_code']
        self.zip_code = attributes[:'zip_code']
      end
      
    end

    # Check equality by comparing each attribute.
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          city == o.city &&
          country == o.country &&
          emails == o.emails &&
          fax == o.fax &&
          first_name == o.first_name &&
          id == o.id &&
          last_name == o.last_name &&
          mobile == o.mobile &&
          note == o.note &&
          personal == o.personal &&
          phone_1 == o.phone_1 &&
          phone_2 == o.phone_2 &&
          salutation == o.salutation &&
          street == o.street &&
          suffix_1 == o.suffix_1 &&
          suffix_2 == o.suffix_2 &&
          title == o.title &&
          zip_code == o.zip_code
    end

    # @see the `==` method
    def eql?(o)
      self == o
    end

    # Calculate hash code according to all attributes.
    def hash
      [city, country, emails, fax, first_name, id, last_name, mobile, note, personal, phone_1, phone_2, salutation, street, suffix_1, suffix_2, title, zip_code].hash
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
