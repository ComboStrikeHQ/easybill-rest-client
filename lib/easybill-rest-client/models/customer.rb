require 'date'

module Easybill
  class Customer
    # 1: Empfehlung eines anderen Kunden, 2: Zeitungsanzeige, 3: ...
    attr_accessor :acquire_options

    attr_accessor :bank_account

    attr_accessor :bank_account_owner

    attr_accessor :bank_bic

    attr_accessor :bank_code

    attr_accessor :bank_iban

    attr_accessor :bank_name

    attr_accessor :birth_date

    attr_accessor :cash_allowance

    attr_accessor :cash_allowance_days

    attr_accessor :cash_discount

    attr_accessor :cash_discount_type

    attr_accessor :city

    attr_accessor :company_name

    attr_accessor :country

    attr_accessor :delivery_city

    attr_accessor :delivery_company_name

    attr_accessor :delivery_country

    attr_accessor :delivery_first_name

    attr_accessor :delivery_last_name

    attr_accessor :delivery_personal

    attr_accessor :delivery_salutation

    attr_accessor :delivery_street

    attr_accessor :delivery_suffix_1

    attr_accessor :delivery_suffix_2

    attr_accessor :delivery_zip_code

    attr_accessor :emails

    attr_accessor :fax

    attr_accessor :first_name

    attr_accessor :grace_period

    attr_accessor :group_id

    attr_accessor :id

    attr_accessor :info_1

    attr_accessor :info_2

    attr_accessor :internet

    attr_accessor :last_name

    attr_accessor :mobile

    attr_accessor :note

    attr_accessor :number

    attr_accessor :payment_options

    attr_accessor :personal

    attr_accessor :phone_1

    attr_accessor :phone_2

    attr_accessor :postbox

    attr_accessor :postbox_city

    attr_accessor :postbox_country

    attr_accessor :postbox_zip_code

    attr_accessor :sale_price_level

    attr_accessor :salutation

    # BASIC = SEPA-Basislastschrift, COR1 = SEPA-Basislastschrift COR1, COMPANY = SEPA-Firmenlastschrift, NULL = Noch kein Mandat erteilt
    attr_accessor :sepa_agreement

    attr_accessor :sepa_agreement_date

    attr_accessor :sepa_mandate_reference

    attr_accessor :since_date

    attr_accessor :street

    attr_accessor :suffix_1

    attr_accessor :suffix_2

    attr_accessor :tax_number

    attr_accessor :tax_options

    attr_accessor :title

    attr_accessor :vat_identifier

    attr_accessor :zip_code

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        
        :'acquire_options' => :'acquire_options',
        
        :'bank_account' => :'bank_account',
        
        :'bank_account_owner' => :'bank_account_owner',
        
        :'bank_bic' => :'bank_bic',
        
        :'bank_code' => :'bank_code',
        
        :'bank_iban' => :'bank_iban',
        
        :'bank_name' => :'bank_name',
        
        :'birth_date' => :'birth_date',
        
        :'cash_allowance' => :'cash_allowance',
        
        :'cash_allowance_days' => :'cash_allowance_days',
        
        :'cash_discount' => :'cash_discount',
        
        :'cash_discount_type' => :'cash_discount_type',
        
        :'city' => :'city',
        
        :'company_name' => :'company_name',
        
        :'country' => :'country',
        
        :'delivery_city' => :'delivery_city',
        
        :'delivery_company_name' => :'delivery_company_name',
        
        :'delivery_country' => :'delivery_country',
        
        :'delivery_first_name' => :'delivery_first_name',
        
        :'delivery_last_name' => :'delivery_last_name',
        
        :'delivery_personal' => :'delivery_personal',
        
        :'delivery_salutation' => :'delivery_salutation',
        
        :'delivery_street' => :'delivery_street',
        
        :'delivery_suffix_1' => :'delivery_suffix_1',
        
        :'delivery_suffix_2' => :'delivery_suffix_2',
        
        :'delivery_zip_code' => :'delivery_zip_code',
        
        :'emails' => :'emails',
        
        :'fax' => :'fax',
        
        :'first_name' => :'first_name',
        
        :'grace_period' => :'grace_period',
        
        :'group_id' => :'group_id',
        
        :'id' => :'id',
        
        :'info_1' => :'info_1',
        
        :'info_2' => :'info_2',
        
        :'internet' => :'internet',
        
        :'last_name' => :'last_name',
        
        :'mobile' => :'mobile',
        
        :'note' => :'note',
        
        :'number' => :'number',
        
        :'payment_options' => :'payment_options',
        
        :'personal' => :'personal',
        
        :'phone_1' => :'phone_1',
        
        :'phone_2' => :'phone_2',
        
        :'postbox' => :'postbox',
        
        :'postbox_city' => :'postbox_city',
        
        :'postbox_country' => :'postbox_country',
        
        :'postbox_zip_code' => :'postbox_zip_code',
        
        :'sale_price_level' => :'sale_price_level',
        
        :'salutation' => :'salutation',
        
        :'sepa_agreement' => :'sepa_agreement',
        
        :'sepa_agreement_date' => :'sepa_agreement_date',
        
        :'sepa_mandate_reference' => :'sepa_mandate_reference',
        
        :'since_date' => :'since_date',
        
        :'street' => :'street',
        
        :'suffix_1' => :'suffix_1',
        
        :'suffix_2' => :'suffix_2',
        
        :'tax_number' => :'tax_number',
        
        :'tax_options' => :'tax_options',
        
        :'title' => :'title',
        
        :'vat_identifier' => :'vat_identifier',
        
        :'zip_code' => :'zip_code'
        
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'acquire_options' => :'String',
        :'bank_account' => :'String',
        :'bank_account_owner' => :'String',
        :'bank_bic' => :'String',
        :'bank_code' => :'String',
        :'bank_iban' => :'String',
        :'bank_name' => :'String',
        :'birth_date' => :'Date',
        :'cash_allowance' => :'String',
        :'cash_allowance_days' => :'String',
        :'cash_discount' => :'String',
        :'cash_discount_type' => :'String',
        :'city' => :'String',
        :'company_name' => :'String',
        :'country' => :'String',
        :'delivery_city' => :'String',
        :'delivery_company_name' => :'String',
        :'delivery_country' => :'String',
        :'delivery_first_name' => :'String',
        :'delivery_last_name' => :'String',
        :'delivery_personal' => :'String',
        :'delivery_salutation' => :'String',
        :'delivery_street' => :'String',
        :'delivery_suffix_1' => :'String',
        :'delivery_suffix_2' => :'String',
        :'delivery_zip_code' => :'String',
        :'emails' => :'Array<String>',
        :'fax' => :'String',
        :'first_name' => :'String',
        :'grace_period' => :'String',
        :'group_id' => :'String',
        :'id' => :'Integer',
        :'info_1' => :'String',
        :'info_2' => :'String',
        :'internet' => :'String',
        :'last_name' => :'String',
        :'mobile' => :'String',
        :'note' => :'String',
        :'number' => :'String',
        :'payment_options' => :'String',
        :'personal' => :'BOOLEAN',
        :'phone_1' => :'String',
        :'phone_2' => :'String',
        :'postbox' => :'String',
        :'postbox_city' => :'String',
        :'postbox_country' => :'String',
        :'postbox_zip_code' => :'String',
        :'sale_price_level' => :'String',
        :'salutation' => :'String',
        :'sepa_agreement' => :'String',
        :'sepa_agreement_date' => :'Date',
        :'sepa_mandate_reference' => :'String',
        :'since_date' => :'Date',
        :'street' => :'String',
        :'suffix_1' => :'String',
        :'suffix_2' => :'String',
        :'tax_number' => :'String',
        :'tax_options' => :'String',
        :'title' => :'String',
        :'vat_identifier' => :'String',
        :'zip_code' => :'String'
        
      }
    end

    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}

      
      if attributes[:'acquire_options']
        self.acquire_options = attributes[:'acquire_options']
      end
      
      if attributes[:'bank_account']
        self.bank_account = attributes[:'bank_account']
      end
      
      if attributes[:'bank_account_owner']
        self.bank_account_owner = attributes[:'bank_account_owner']
      end
      
      if attributes[:'bank_bic']
        self.bank_bic = attributes[:'bank_bic']
      end
      
      if attributes[:'bank_code']
        self.bank_code = attributes[:'bank_code']
      end
      
      if attributes[:'bank_iban']
        self.bank_iban = attributes[:'bank_iban']
      end
      
      if attributes[:'bank_name']
        self.bank_name = attributes[:'bank_name']
      end
      
      if attributes[:'birth_date']
        self.birth_date = attributes[:'birth_date']
      end
      
      if attributes[:'cash_allowance']
        self.cash_allowance = attributes[:'cash_allowance']
      end
      
      if attributes[:'cash_allowance_days']
        self.cash_allowance_days = attributes[:'cash_allowance_days']
      end
      
      if attributes[:'cash_discount']
        self.cash_discount = attributes[:'cash_discount']
      end
      
      if attributes[:'cash_discount_type']
        self.cash_discount_type = attributes[:'cash_discount_type']
      end
      
      if attributes[:'city']
        self.city = attributes[:'city']
      end
      
      if attributes[:'company_name']
        self.company_name = attributes[:'company_name']
      end
      
      if attributes[:'country']
        self.country = attributes[:'country']
      end
      
      if attributes[:'delivery_city']
        self.delivery_city = attributes[:'delivery_city']
      end
      
      if attributes[:'delivery_company_name']
        self.delivery_company_name = attributes[:'delivery_company_name']
      end
      
      if attributes[:'delivery_country']
        self.delivery_country = attributes[:'delivery_country']
      end
      
      if attributes[:'delivery_first_name']
        self.delivery_first_name = attributes[:'delivery_first_name']
      end
      
      if attributes[:'delivery_last_name']
        self.delivery_last_name = attributes[:'delivery_last_name']
      end
      
      if attributes[:'delivery_personal']
        self.delivery_personal = attributes[:'delivery_personal']
      end
      
      if attributes[:'delivery_salutation']
        self.delivery_salutation = attributes[:'delivery_salutation']
      end
      
      if attributes[:'delivery_street']
        self.delivery_street = attributes[:'delivery_street']
      end
      
      if attributes[:'delivery_suffix_1']
        self.delivery_suffix_1 = attributes[:'delivery_suffix_1']
      end
      
      if attributes[:'delivery_suffix_2']
        self.delivery_suffix_2 = attributes[:'delivery_suffix_2']
      end
      
      if attributes[:'delivery_zip_code']
        self.delivery_zip_code = attributes[:'delivery_zip_code']
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
      
      if attributes[:'grace_period']
        self.grace_period = attributes[:'grace_period']
      end
      
      if attributes[:'group_id']
        self.group_id = attributes[:'group_id']
      end
      
      if attributes[:'id']
        self.id = attributes[:'id']
      end
      
      if attributes[:'info_1']
        self.info_1 = attributes[:'info_1']
      end
      
      if attributes[:'info_2']
        self.info_2 = attributes[:'info_2']
      end
      
      if attributes[:'internet']
        self.internet = attributes[:'internet']
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
      
      if attributes[:'number']
        self.number = attributes[:'number']
      end
      
      if attributes[:'payment_options']
        self.payment_options = attributes[:'payment_options']
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
      
      if attributes[:'postbox']
        self.postbox = attributes[:'postbox']
      end
      
      if attributes[:'postbox_city']
        self.postbox_city = attributes[:'postbox_city']
      end
      
      if attributes[:'postbox_country']
        self.postbox_country = attributes[:'postbox_country']
      end
      
      if attributes[:'postbox_zip_code']
        self.postbox_zip_code = attributes[:'postbox_zip_code']
      end
      
      if attributes[:'sale_price_level']
        self.sale_price_level = attributes[:'sale_price_level']
      end
      
      if attributes[:'salutation']
        self.salutation = attributes[:'salutation']
      end
      
      if attributes[:'sepa_agreement']
        self.sepa_agreement = attributes[:'sepa_agreement']
      end
      
      if attributes[:'sepa_agreement_date']
        self.sepa_agreement_date = attributes[:'sepa_agreement_date']
      end
      
      if attributes[:'sepa_mandate_reference']
        self.sepa_mandate_reference = attributes[:'sepa_mandate_reference']
      end
      
      if attributes[:'since_date']
        self.since_date = attributes[:'since_date']
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
      
      if attributes[:'tax_number']
        self.tax_number = attributes[:'tax_number']
      end
      
      if attributes[:'tax_options']
        self.tax_options = attributes[:'tax_options']
      end
      
      if attributes[:'title']
        self.title = attributes[:'title']
      end
      
      if attributes[:'vat_identifier']
        self.vat_identifier = attributes[:'vat_identifier']
      end
      
      if attributes[:'zip_code']
        self.zip_code = attributes[:'zip_code']
      end
      
    end

    # Custom attribute writer method checking allowed values (enum).
    def acquire_options=(acquire_options)
      allowed_values = ["1", "2", "3", "4", "5", "6", "7", "8"]
      if acquire_options && !allowed_values.include?(acquire_options)
        fail "invalid value for 'acquire_options', must be one of #{allowed_values}"
      end
      @acquire_options = acquire_options
    end

    # Custom attribute writer method checking allowed values (enum).
    def sepa_agreement=(sepa_agreement)
      allowed_values = ["BASIC", "COR1", "COMPANY"]
      if sepa_agreement && !allowed_values.include?(sepa_agreement)
        fail "invalid value for 'sepa_agreement', must be one of #{allowed_values}"
      end
      @sepa_agreement = sepa_agreement
    end

    # Check equality by comparing each attribute.
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          acquire_options == o.acquire_options &&
          bank_account == o.bank_account &&
          bank_account_owner == o.bank_account_owner &&
          bank_bic == o.bank_bic &&
          bank_code == o.bank_code &&
          bank_iban == o.bank_iban &&
          bank_name == o.bank_name &&
          birth_date == o.birth_date &&
          cash_allowance == o.cash_allowance &&
          cash_allowance_days == o.cash_allowance_days &&
          cash_discount == o.cash_discount &&
          cash_discount_type == o.cash_discount_type &&
          city == o.city &&
          company_name == o.company_name &&
          country == o.country &&
          delivery_city == o.delivery_city &&
          delivery_company_name == o.delivery_company_name &&
          delivery_country == o.delivery_country &&
          delivery_first_name == o.delivery_first_name &&
          delivery_last_name == o.delivery_last_name &&
          delivery_personal == o.delivery_personal &&
          delivery_salutation == o.delivery_salutation &&
          delivery_street == o.delivery_street &&
          delivery_suffix_1 == o.delivery_suffix_1 &&
          delivery_suffix_2 == o.delivery_suffix_2 &&
          delivery_zip_code == o.delivery_zip_code &&
          emails == o.emails &&
          fax == o.fax &&
          first_name == o.first_name &&
          grace_period == o.grace_period &&
          group_id == o.group_id &&
          id == o.id &&
          info_1 == o.info_1 &&
          info_2 == o.info_2 &&
          internet == o.internet &&
          last_name == o.last_name &&
          mobile == o.mobile &&
          note == o.note &&
          number == o.number &&
          payment_options == o.payment_options &&
          personal == o.personal &&
          phone_1 == o.phone_1 &&
          phone_2 == o.phone_2 &&
          postbox == o.postbox &&
          postbox_city == o.postbox_city &&
          postbox_country == o.postbox_country &&
          postbox_zip_code == o.postbox_zip_code &&
          sale_price_level == o.sale_price_level &&
          salutation == o.salutation &&
          sepa_agreement == o.sepa_agreement &&
          sepa_agreement_date == o.sepa_agreement_date &&
          sepa_mandate_reference == o.sepa_mandate_reference &&
          since_date == o.since_date &&
          street == o.street &&
          suffix_1 == o.suffix_1 &&
          suffix_2 == o.suffix_2 &&
          tax_number == o.tax_number &&
          tax_options == o.tax_options &&
          title == o.title &&
          vat_identifier == o.vat_identifier &&
          zip_code == o.zip_code
    end

    # @see the `==` method
    def eql?(o)
      self == o
    end

    # Calculate hash code according to all attributes.
    def hash
      [acquire_options, bank_account, bank_account_owner, bank_bic, bank_code, bank_iban, bank_name, birth_date, cash_allowance, cash_allowance_days, cash_discount, cash_discount_type, city, company_name, country, delivery_city, delivery_company_name, delivery_country, delivery_first_name, delivery_last_name, delivery_personal, delivery_salutation, delivery_street, delivery_suffix_1, delivery_suffix_2, delivery_zip_code, emails, fax, first_name, grace_period, group_id, id, info_1, info_2, internet, last_name, mobile, note, number, payment_options, personal, phone_1, phone_2, postbox, postbox_city, postbox_country, postbox_zip_code, sale_price_level, salutation, sepa_agreement, sepa_agreement_date, sepa_mandate_reference, since_date, street, suffix_1, suffix_2, tax_number, tax_options, title, vat_identifier, zip_code].hash
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
