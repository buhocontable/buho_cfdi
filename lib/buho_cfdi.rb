require "buho_cfdi/version"
require "nokogiri"
require "buho_cfdi/i18n"
require "buho_cfdi/base_node"

require_relative "buho_cfdi/nodes/collection"
require_relative "buho_cfdi/nodes/cfdi_related"
require_relative "buho_cfdi/nodes/concept"
require_relative "buho_cfdi/nodes/customs_information"
require_relative "buho_cfdi/nodes/issuer"
require_relative "buho_cfdi/nodes/receipt"
require_relative "buho_cfdi/nodes/receiver"
require_relative "buho_cfdi/nodes/related"
require_relative "buho_cfdi/nodes/tax_detained"
require_relative "buho_cfdi/nodes/tax_transferred"
require_relative "buho_cfdi/nodes/property_account"
require_relative "buho_cfdi/nodes/part"
require_relative "buho_cfdi/nodes/taxes"
require_relative "buho_cfdi/nodes/detained"
require_relative "buho_cfdi/nodes/transferred"

require "buho_cfdi/params_builder"
require "buho_cfdi/strategy"

module BuhoCfdi
  class XmlProcessor
    attr_accessor :strategy, :receipt, :cfdi

    def initialize(params)
      @strategy = XML_BUILDING_STRATEGY

      @receipt = BuhoCfdi::ParamsBuilder.new(params).receipt
    end

    def process_xml
      @cfdi = strategy.call(receipt)

      # file = File.new('xml_example.xml', 'w+')
      # file.write(cfdi.to_xml)
      # file.close

      cfdi
    end
  end
end
