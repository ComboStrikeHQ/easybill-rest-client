require 'date'

module Easybill
  class Task
    attr_accessor :category

    attr_accessor :category_custom

    attr_accessor :created_at

    attr_accessor :customer_id

    attr_accessor :description

    attr_accessor :document_id

    attr_accessor :end_at

    attr_accessor :finish_at

    attr_accessor :id

    attr_accessor :name

    attr_accessor :position_id

    attr_accessor :priority

    attr_accessor :project_id

    attr_accessor :start_at

    attr_accessor :status

    attr_accessor :status_percent

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        
        :'category' => :'category',
        
        :'category_custom' => :'category_custom',
        
        :'created_at' => :'created_at',
        
        :'customer_id' => :'customer_id',
        
        :'description' => :'description',
        
        :'document_id' => :'document_id',
        
        :'end_at' => :'end_at',
        
        :'finish_at' => :'finish_at',
        
        :'id' => :'id',
        
        :'name' => :'name',
        
        :'position_id' => :'position_id',
        
        :'priority' => :'priority',
        
        :'project_id' => :'project_id',
        
        :'start_at' => :'start_at',
        
        :'status' => :'status',
        
        :'status_percent' => :'status_percent'
        
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'category' => :'String',
        :'category_custom' => :'String',
        :'created_at' => :'String',
        :'customer_id' => :'Integer',
        :'description' => :'String',
        :'document_id' => :'Integer',
        :'end_at' => :'String',
        :'finish_at' => :'String',
        :'id' => :'Integer',
        :'name' => :'String',
        :'position_id' => :'Integer',
        :'priority' => :'String',
        :'project_id' => :'Integer',
        :'start_at' => :'String',
        :'status' => :'String',
        :'status_percent' => :'String'
        
      }
    end

    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}

      
      if attributes[:'category']
        self.category = attributes[:'category']
      end
      
      if attributes[:'category_custom']
        self.category_custom = attributes[:'category_custom']
      end
      
      if attributes[:'created_at']
        self.created_at = attributes[:'created_at']
      end
      
      if attributes[:'customer_id']
        self.customer_id = attributes[:'customer_id']
      end
      
      if attributes[:'description']
        self.description = attributes[:'description']
      end
      
      if attributes[:'document_id']
        self.document_id = attributes[:'document_id']
      end
      
      if attributes[:'end_at']
        self.end_at = attributes[:'end_at']
      end
      
      if attributes[:'finish_at']
        self.finish_at = attributes[:'finish_at']
      end
      
      if attributes[:'id']
        self.id = attributes[:'id']
      end
      
      if attributes[:'name']
        self.name = attributes[:'name']
      end
      
      if attributes[:'position_id']
        self.position_id = attributes[:'position_id']
      end
      
      if attributes[:'priority']
        self.priority = attributes[:'priority']
      end
      
      if attributes[:'project_id']
        self.project_id = attributes[:'project_id']
      end
      
      if attributes[:'start_at']
        self.start_at = attributes[:'start_at']
      end
      
      if attributes[:'status']
        self.status = attributes[:'status']
      end
      
      if attributes[:'status_percent']
        self.status_percent = attributes[:'status_percent']
      end
      
    end

    # Check equality by comparing each attribute.
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          category == o.category &&
          category_custom == o.category_custom &&
          created_at == o.created_at &&
          customer_id == o.customer_id &&
          description == o.description &&
          document_id == o.document_id &&
          end_at == o.end_at &&
          finish_at == o.finish_at &&
          id == o.id &&
          name == o.name &&
          position_id == o.position_id &&
          priority == o.priority &&
          project_id == o.project_id &&
          start_at == o.start_at &&
          status == o.status &&
          status_percent == o.status_percent
    end

    # @see the `==` method
    def eql?(o)
      self == o
    end

    # Calculate hash code according to all attributes.
    def hash
      [category, category_custom, created_at, customer_id, description, document_id, end_at, finish_at, id, name, position_id, priority, project_id, start_at, status, status_percent].hash
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
