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
require_relative "buho_cfdi/nodes/cancellation"
require_relative "buho_cfdi/nodes/uuid"
require_relative "buho_cfdi/nodes/payroll"
require_relative "buho_cfdi/nodes/payroll_issuer"
require_relative "buho_cfdi/nodes/payroll_receiver"
require_relative "buho_cfdi/nodes/perceptions"
require_relative "buho_cfdi/nodes/perception"
require_relative "buho_cfdi/nodes/deductions"
require_relative "buho_cfdi/nodes/deduction"
require_relative "buho_cfdi/nodes/employment_subsidy"
require_relative "buho_cfdi/nodes/incapacity"
require_relative "buho_cfdi/nodes/other_payment"
require_relative "buho_cfdi/nodes/payroll_extra_hours"
require_relative "buho_cfdi/nodes/payroll_receipt"
require_relative "buho_cfdi/nodes/global_info"
require_relative "buho_cfdi/nodes/payment_info"
require_relative "buho_cfdi/nodes/payment_transfer"
require_relative "buho_cfdi/nodes/payment_totals"
require_relative "buho_cfdi/nodes/related_doc"
require_relative "buho_cfdi/nodes/related_doc_transfer"
require_relative "buho_cfdi/nodes/related_doc_retention"

require "buho_cfdi/cancellation_builder"
require "buho_cfdi/cancellation_strategy"
require "buho_cfdi/stamp_strategy"
require "buho_cfdi/payroll_strategy"
require "buho_cfdi/params_builder"
require "buho_cfdi/payroll_builder"
require "buho_cfdi/certificate"
require "buho_cfdi/key"

module BuhoCfdi
  class XmlProcessor
    attr_accessor(
      :stamp_strategy,
      :receipt,
      :cancellation_strategy,
      :cancellation,
      :payroll_strategy,
      :payroll_receipt,
      :cfdi,
      :params
    )

    def initialize(params)
      @params = params
      @stamp_strategy = STAMP_STRATEGY
      @cancellation_strategy = CANCELLATION_STRATEGY
      @payroll_strategy = PAYROLL_STRATEGY
    end

    def process_xml
      xml_params_builder
      @cfdi = stamp_strategy.call(receipt)

      cfdi
    end

    def process_cancellation
      xml_cancellation_builder
      @cfdi = cancellation_strategy.call(cancellation)

      cfdi
    end

    def process_payroll
      xml_payroll_builder
      @cfdi = payroll_strategy.call(payroll_receipt)
      cfdi
    end

    private

    def create_temp_xml_file
      file = File.new('xml_example.xml', 'w+')
      file.write(cfdi.to_xml)
      file.close
    end

    def xml_params_builder
      @receipt = BuhoCfdi::ParamsBuilder.new(params).receipt
    end

    def xml_cancellation_builder
      @cancellation = BuhoCfdi::CancellationBuilder.new(params).cancellation
    end

    def xml_payroll_builder
      @payroll_receipt = BuhoCfdi::PayrollBuilder.new(params).payroll_receipt
    end

  end
end
