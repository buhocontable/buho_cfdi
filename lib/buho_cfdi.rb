require "buho_cfdi/version"
require "nokogiri"
require "buho_cfdi/base_node"
require "buho_cfdi/i18n"
require "buho_cfdi/strategy"

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

module BuhoCfdi
  class Processor
    attr_accessor :strategy, :xml

    def initialize(&strategy)
      @strategy = strategy
    end

    def process!
      xml = Nokogiri::XML::Builder.new(encoding: 'UTF-8', &strategy)
    end
  end
end
