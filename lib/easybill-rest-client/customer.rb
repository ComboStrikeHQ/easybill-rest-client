module EasybillRestClient
  class Customer
    include Virtus.model
    attribute :acquire_options, String # a digit 1..8
    attribute :bank_account, String
    attribute :bank_account_owner, String
    attribute :bank_bic, String
    attribute :bank_code, String
    attribute :bank_iban, String
    attribute :bank_name, String
    attribute :birth_date, String
    attribute :cash_allowance, String
    attribute :cash_allowance_days, String
    attribute :cash_discount, String
    attribute :cash_discount_type, String
    attribute :city, String
    attribute :company_name, String
    attribute :country, String
    attribute :delivery_city, String
    attribute :delivery_company_name, String
    attribute :delivery_country, String
    attribute :delivery_first_name, String
    attribute :delivery_last_name, String
    attribute :delivery_personal, String
    attribute :delivery_salutation, String
    attribute :delivery_street, String
    attribute :delivery_suffix_1, String
    attribute :delivery_suffix_2, String
    attribute :delivery_zip_code, String
    attribute :emails, Array[String]
    attribute :fax, String
    attribute :first_name, String
    attribute :grace_period, String
    attribute :group_id, String
    attribute :id, Integer
    attribute :info_1, String
    attribute :info_2, String
    attribute :internet, String
    attribute :last_name, String
    attribute :mobile, String
    attribute :note, String
    attribute :number, String
    attribute :payment_options, String
    attribute :personal, Boolean
    attribute :phone_1, String
    attribute :phone_2, String
    attribute :postbox, String
    attribute :postbox_city, String
    attribute :postbox_country, String
    attribute :postbox_zip_code, String
    attribute :sale_price_level, String
    attribute :salutation, String
    attribute :sepa_agreement, String
    attribute :sepa_agreement_date, String
    attribute :sepa_mandate_reference, String
    attribute :since_date, String
    attribute :street, String
    attribute :suffix_1, String
    attribute :suffix_2, String
    attribute :tax_number, String
    attribute :tax_options, String
    attribute :title, String
    attribute :vat_identifier, String
    attribute :zip_code, String
  end
end
