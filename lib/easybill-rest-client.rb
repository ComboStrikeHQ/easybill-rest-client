# Common files
require 'easybill-rest-client/api_client'
require 'easybill-rest-client/api_error'
require 'easybill-rest-client/version'
require 'easybill-rest-client/configuration'

# Models
require 'easybill-rest-client/models/customer'
require 'easybill-rest-client/models/customers'
require 'easybill-rest-client/models/contact'
require 'easybill-rest-client/models/contacts'
require 'easybill-rest-client/models/document_position'
require 'easybill-rest-client/models/document_address'
require 'easybill-rest-client/models/document_recurring'
require 'easybill-rest-client/models/document'
require 'easybill-rest-client/models/documents'
require 'easybill-rest-client/models/customer_group'
require 'easybill-rest-client/models/customer_groups'
require 'easybill-rest-client/models/task'
require 'easybill-rest-client/models/tasks'
require 'easybill-rest-client/models/project'
require 'easybill-rest-client/models/projects'
require 'easybill-rest-client/models/position'
require 'easybill-rest-client/models/positions'
require 'easybill-rest-client/models/position_group'
require 'easybill-rest-client/models/position_groups'
require 'easybill-rest-client/models/time_tracking'
require 'easybill-rest-client/models/time_trackings'
require 'easybill-rest-client/models/text_template'
require 'easybill-rest-client/models/text_templates'
require 'easybill-rest-client/models/attachment'
require 'easybill-rest-client/models/attachments'
require 'easybill-rest-client/models/document_payment'
require 'easybill-rest-client/models/document_payments'
require 'easybill-rest-client/models/post_box'

# APIs
require 'easybill-rest-client/api/position_group_api'
require 'easybill-rest-client/api/customer_api'
require 'easybill-rest-client/api/text_template_api'
require 'easybill-rest-client/api/document_api'
require 'easybill-rest-client/api/attachment_api'
require 'easybill-rest-client/api/time_tracking_api'
require 'easybill-rest-client/api/task_api'
require 'easybill-rest-client/api/contact_api'
require 'easybill-rest-client/api/position_api'
require 'easybill-rest-client/api/project_api'
require 'easybill-rest-client/api/customer_group_api'
require 'easybill-rest-client/api/document_payment_api'

module Easybill
  class << self
    # Customize default settings for the SDK using block.
    #   Easybill.configure do |config|
    #     config.username = "xxx"
    #     config.password = "xxx"
    #   end
    # If no block given, return the default Configuration object.
    def configure
      if block_given?
        yield(Configuration.default)
      else
        Configuration.default
      end
    end
  end
end
