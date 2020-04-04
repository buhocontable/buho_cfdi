module BuhoCfdi
  class Taxes < BaseNode
     attr_accessor :transferred, :detained

    def initialize(params = {})
      super
      @transferred = []
      @detained = []
    end

    def transferred=(data)
      if data.is_a? Array
        data.map do |c|
          c = TaxTransferred.new(c) unless c.is_a? TaxTransferred
          @transferred << c
        end
      elsif data.is_a? Hash
        @transferred << TaxTransferred.new(data)
      elsif data.is_a? TaxTransferred
        @transferred << data
      end
      @transferred
    end

    def detained=(data)
      if data.is_a? Array
        data.map do |c|
          c << TaxDetained.new(c) unless c.is_a? TaxDetained
          @detained << c
        end
      elsif data.is_a? Hash
        @detained << TaxDetained.new(data)
      elsif data.is_a? TaxDetained
        @detained << data
      end
      @detained
    end

    def total_transferred
      return 0 unless @transferred.any?
      @transferred.map(&:import).reduce(:+)
    end

    # return total of all detained taxes.
    def total_detained
      return 0 unless @detained.any?
      @detained.map(&:import).reduce(:+)
    end

    def to_x
      {TotalImpuestosRetenidos: format('%.2f',total_detained.to_f), TotalImpuestosTrasladados: format('%.2f',total_transferred.to_f)}
    end
  

  end
end