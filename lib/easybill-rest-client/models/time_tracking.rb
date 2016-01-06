require 'date'

module Easybill
  class TimeTracking
    attr_accessor :cleared_at

    attr_accessor :count

    attr_accessor :date

    attr_accessor :date_from_at

    attr_accessor :date_thru_at

    attr_accessor :description

    attr_accessor :hourly_rate

    attr_accessor :id

    attr_accessor :note

    attr_accessor :number

    attr_accessor :position_id

    attr_accessor :project_id

    attr_accessor :timer_value

    attr_accessor :type

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        
        :'cleared_at' => :'cleared_at',
        
        :'count' => :'count',
        
        :'date' => :'date',
        
        :'date_from_at' => :'date_from_at',
        
        :'date_thru_at' => :'date_thru_at',
        
        :'description' => :'description',
        
        :'hourly_rate' => :'hourly_rate',
        
        :'id' => :'id',
        
        :'note' => :'note',
        
        :'number' => :'number',
        
        :'position_id' => :'position_id',
        
        :'project_id' => :'project_id',
        
        :'timer_value' => :'timer_value',
        
        :'type' => :'type'
        
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'cleared_at' => :'String',
        :'count' => :'String',
        :'date' => :'String',
        :'date_from_at' => :'String',
        :'date_thru_at' => :'String',
        :'description' => :'String',
        :'hourly_rate' => :'String',
        :'id' => :'Integer',
        :'note' => :'String',
        :'number' => :'String',
        :'position_id' => :'Integer',
        :'project_id' => :'Integer',
        :'timer_value' => :'String',
        :'type' => :'String'
        
      }
    end

    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}

      
      if attributes[:'cleared_at']
        self.cleared_at = attributes[:'cleared_at']
      end
      
      if attributes[:'count']
        self.count = attributes[:'count']
      end
      
      if attributes[:'date']
        self.date = attributes[:'date']
      end
      
      if attributes[:'date_from_at']
        self.date_from_at = attributes[:'date_from_at']
      end
      
      if attributes[:'date_thru_at']
        self.date_thru_at = attributes[:'date_thru_at']
      end
      
      if attributes[:'description']
        self.description = attributes[:'description']
      end
      
      if attributes[:'hourly_rate']
        self.hourly_rate = attributes[:'hourly_rate']
      end
      
      if attributes[:'id']
        self.id = attributes[:'id']
      end
      
      if attributes[:'note']
        self.note = attributes[:'note']
      end
      
      if attributes[:'number']
        self.number = attributes[:'number']
      end
      
      if attributes[:'position_id']
        self.position_id = attributes[:'position_id']
      end
      
      if attributes[:'project_id']
        self.project_id = attributes[:'project_id']
      end
      
      if attributes[:'timer_value']
        self.timer_value = attributes[:'timer_value']
      end
      
      if attributes[:'type']
        self.type = attributes[:'type']
      end
      
    end

    # Check equality by comparing each attribute.
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          cleared_at == o.cleared_at &&
          count == o.count &&
          date == o.date &&
          date_from_at == o.date_from_at &&
          date_thru_at == o.date_thru_at &&
          description == o.description &&
          hourly_rate == o.hourly_rate &&
          id == o.id &&
          note == o.note &&
          number == o.number &&
          position_id == o.position_id &&
          project_id == o.project_id &&
          timer_value == o.timer_value &&
          type == o.type
    end

    # @see the `==` method
    def eql?(o)
      self == o
    end

    # Calculate hash code according to all attributes.
    def hash
      [cleared_at, count, date, date_from_at, date_thru_at, description, hourly_rate, id, note, number, position_id, project_id, timer_value, type].hash
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
