require 'date'

module Easybill
  class DocumentRecurring
    attr_accessor :next_date

    attr_accessor :frequency

    attr_accessor :frequency_special

    attr_accessor :interval

    # Date of last exectution day or number of times to exectute
    attr_accessor :end_date_or_count

    attr_accessor :status

    attr_accessor :as_draft

    attr_accessor :is_notify

    attr_accessor :send_as

    attr_accessor :is_sign

    attr_accessor :is_paid

    attr_accessor :is_sepa

    attr_accessor :sepa_local_instrument

    attr_accessor :sepa_sequence_type

    attr_accessor :sepa_reference

    attr_accessor :sepa_remittance_information

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        
        :'next_date' => :'next_date',
        
        :'frequency' => :'frequency',
        
        :'frequency_special' => :'frequency_special',
        
        :'interval' => :'interval',
        
        :'end_date_or_count' => :'end_date_or_count',
        
        :'status' => :'status',
        
        :'as_draft' => :'as_draft',
        
        :'is_notify' => :'is_notify',
        
        :'send_as' => :'send_as',
        
        :'is_sign' => :'is_sign',
        
        :'is_paid' => :'is_paid',
        
        :'is_sepa' => :'is_sepa',
        
        :'sepa_local_instrument' => :'sepa_local_instrument',
        
        :'sepa_sequence_type' => :'sepa_sequence_type',
        
        :'sepa_reference' => :'sepa_reference',
        
        :'sepa_remittance_information' => :'sepa_remittance_information'
        
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'next_date' => :'Date',
        :'frequency' => :'String',
        :'frequency_special' => :'String',
        :'interval' => :'Integer',
        :'end_date_or_count' => :'String',
        :'status' => :'String',
        :'as_draft' => :'BOOLEAN',
        :'is_notify' => :'BOOLEAN',
        :'send_as' => :'String',
        :'is_sign' => :'BOOLEAN',
        :'is_paid' => :'BOOLEAN',
        :'is_sepa' => :'BOOLEAN',
        :'sepa_local_instrument' => :'String',
        :'sepa_sequence_type' => :'String',
        :'sepa_reference' => :'String',
        :'sepa_remittance_information' => :'String'
        
      }
    end

    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}

      
      if attributes[:'next_date']
        self.next_date = attributes[:'next_date']
      end
      
      if attributes[:'frequency']
        self.frequency = attributes[:'frequency']
      end
      
      if attributes[:'frequency_special']
        self.frequency_special = attributes[:'frequency_special']
      end
      
      if attributes[:'interval']
        self.interval = attributes[:'interval']
      end
      
      if attributes[:'end_date_or_count']
        self.end_date_or_count = attributes[:'end_date_or_count']
      end
      
      if attributes[:'status']
        self.status = attributes[:'status']
      end
      
      if attributes[:'as_draft']
        self.as_draft = attributes[:'as_draft']
      end
      
      if attributes[:'is_notify']
        self.is_notify = attributes[:'is_notify']
      end
      
      if attributes[:'send_as']
        self.send_as = attributes[:'send_as']
      end
      
      if attributes[:'is_sign']
        self.is_sign = attributes[:'is_sign']
      end
      
      if attributes[:'is_paid']
        self.is_paid = attributes[:'is_paid']
      end
      
      if attributes[:'is_sepa']
        self.is_sepa = attributes[:'is_sepa']
      end
      
      if attributes[:'sepa_local_instrument']
        self.sepa_local_instrument = attributes[:'sepa_local_instrument']
      end
      
      if attributes[:'sepa_sequence_type']
        self.sepa_sequence_type = attributes[:'sepa_sequence_type']
      end
      
      if attributes[:'sepa_reference']
        self.sepa_reference = attributes[:'sepa_reference']
      end
      
      if attributes[:'sepa_remittance_information']
        self.sepa_remittance_information = attributes[:'sepa_remittance_information']
      end
      
    end

    # Custom attribute writer method checking allowed values (enum).
    def frequency_special=(frequency_special)
      allowed_values = ["LASTDAYOFMONTH"]
      if frequency_special && !allowed_values.include?(frequency_special)
        fail "invalid value for 'frequency_special', must be one of #{allowed_values}"
      end
      @frequency_special = frequency_special
    end

    # Custom attribute writer method checking allowed values (enum).
    def status=(status)
      allowed_values = ["RUNNING", "PAUSE", "STOP"]
      if status && !allowed_values.include?(status)
        fail "invalid value for 'status', must be one of #{allowed_values}"
      end
      @status = status
    end

    # Custom attribute writer method checking allowed values (enum).
    def send_as=(send_as)
      allowed_values = ["EMAIL", "FAX", "POST"]
      if send_as && !allowed_values.include?(send_as)
        fail "invalid value for 'send_as', must be one of #{allowed_values}"
      end
      @send_as = send_as
    end

    # Custom attribute writer method checking allowed values (enum).
    def sepa_local_instrument=(sepa_local_instrument)
      allowed_values = ["FRST", "OOFF", "FNAL", "RCUR"]
      if sepa_local_instrument && !allowed_values.include?(sepa_local_instrument)
        fail "invalid value for 'sepa_local_instrument', must be one of #{allowed_values}"
      end
      @sepa_local_instrument = sepa_local_instrument
    end

    # Custom attribute writer method checking allowed values (enum).
    def sepa_sequence_type=(sepa_sequence_type)
      allowed_values = ["CORE", "COR1", "B2B"]
      if sepa_sequence_type && !allowed_values.include?(sepa_sequence_type)
        fail "invalid value for 'sepa_sequence_type', must be one of #{allowed_values}"
      end
      @sepa_sequence_type = sepa_sequence_type
    end

    # Check equality by comparing each attribute.
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          next_date == o.next_date &&
          frequency == o.frequency &&
          frequency_special == o.frequency_special &&
          interval == o.interval &&
          end_date_or_count == o.end_date_or_count &&
          status == o.status &&
          as_draft == o.as_draft &&
          is_notify == o.is_notify &&
          send_as == o.send_as &&
          is_sign == o.is_sign &&
          is_paid == o.is_paid &&
          is_sepa == o.is_sepa &&
          sepa_local_instrument == o.sepa_local_instrument &&
          sepa_sequence_type == o.sepa_sequence_type &&
          sepa_reference == o.sepa_reference &&
          sepa_remittance_information == o.sepa_remittance_information
    end

    # @see the `==` method
    def eql?(o)
      self == o
    end

    # Calculate hash code according to all attributes.
    def hash
      [next_date, frequency, frequency_special, interval, end_date_or_count, status, as_draft, is_notify, send_as, is_sign, is_paid, is_sepa, sepa_local_instrument, sepa_sequence_type, sepa_reference, sepa_remittance_information].hash
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
