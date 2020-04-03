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

  end
end