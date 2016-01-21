require 'date'

module Easybill
  class PostBox
    attr_accessor :id

    attr_accessor :document_id

    attr_accessor :to

    attr_accessor :cc

    attr_accessor :from

    attr_accessor :subject

    attr_accessor :message

    attr_accessor :date

    attr_accessor :created_at

    attr_accessor :processed_at

    attr_accessor :send_by_self

    attr_accessor :send_with_attachment

    attr_accessor :type

    attr_accessor :status

    attr_accessor :status_info

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        
        :'id' => :'id',
        
        :'document_id' => :'document_id',
        
        :'to' => :'to',
        
        :'cc' => :'cc',
        
        :'from' => :'from',
        
        :'subject' => :'subject',
        
        :'message' => :'message',
        
        :'date' => :'date',
        
        :'created_at' => :'created_at',
        
        :'processed_at' => :'processed_at',
        
        :'send_by_self' => :'send_by_self',
        
        :'send_with_attachment' => :'send_with_attachment',
        
        :'type' => :'type',
        
        :'status' => :'status',
        
        :'status_info' => :'status_info'
        
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'id' => :'Integer',
        :'document_id' => :'Integer',
        :'to' => :'String',
        :'cc' => :'String',
        :'from' => :'String',
        :'subject' => :'String',
        :'message' => :'String',
        :'date' => :'Date',
        :'created_at' => :'DateTime',
        :'processed_at' => :'DateTime',
        :'send_by_self' => :'BOOLEAN',
        :'send_with_attachment' => :'BOOLEAN',
        :'type' => :'String',
        :'status' => :'String',
        :'status_info' => :'String'
        
      }
    end

    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}

      
      if attributes[:'id']
        self.id = attributes[:'id']
      end
      
      if attributes[:'document_id']
        self.document_id = attributes[:'document_id']
      end
      
      if attributes[:'to']
        self.to = attributes[:'to']
      end
      
      if attributes[:'cc']
        self.cc = attributes[:'cc']
      end
      
      if attributes[:'from']
        self.from = attributes[:'from']
      end
      
      if attributes[:'subject']
        self.subject = attributes[:'subject']
      end
      
      if attributes[:'message']
        self.message = attributes[:'message']
      end
      
      if attributes[:'date']
        self.date = attributes[:'date']
      end
      
      if attributes[:'created_at']
        self.created_at = attributes[:'created_at']
      end
      
      if attributes[:'processed_at']
        self.processed_at = attributes[:'processed_at']
      end
      
      if attributes[:'send_by_self']
        self.send_by_self = attributes[:'send_by_self']
      end
      
      if attributes[:'send_with_attachment']
        self.send_with_attachment = attributes[:'send_with_attachment']
      end
      
      if attributes[:'type']
        self.type = attributes[:'type']
      end
      
      if attributes[:'status']
        self.status = attributes[:'status']
      end
      
      if attributes[:'status_info']
        self.status_info = attributes[:'status_info']
      end
      
    end

    # Custom attribute writer method checking allowed values (enum).
    def type=(type)
      allowed_values = ["FAX", "EMAIL", "POST"]
      if type && !allowed_values.include?(type)
        fail "invalid value for 'type', must be one of #{allowed_values}"
      end
      @type = type
    end

    # Custom attribute writer method checking allowed values (enum).
    def status=(status)
      allowed_values = ["WAITING", "PREPARE", "ERROR", "OK", "PROCESSING"]
      if status && !allowed_values.include?(status)
        fail "invalid value for 'status', must be one of #{allowed_values}"
      end
      @status = status
    end

    # Check equality by comparing each attribute.
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          id == o.id &&
          document_id == o.document_id &&
          to == o.to &&
          cc == o.cc &&
          from == o.from &&
          subject == o.subject &&
          message == o.message &&
          date == o.date &&
          created_at == o.created_at &&
          processed_at == o.processed_at &&
          send_by_self == o.send_by_self &&
          send_with_attachment == o.send_with_attachment &&
          type == o.type &&
          status == o.status &&
          status_info == o.status_info
    end

    # @see the `==` method
    def eql?(o)
      self == o
    end

    # Calculate hash code according to all attributes.
    def hash
      [id, document_id, to, cc, from, subject, message, date, created_at, processed_at, send_by_self, send_with_attachment, type, status, status_info].hash
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
