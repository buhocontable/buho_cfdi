module BuhoCfdi
  class Invoice < BaseNode
    
    attr_accessor(
      :expedition_place,
      :payment_method,
      :proof_type,
      :total,
      :subtotal,
      :currency,
      :certificate,
      :certificate_number, 
      :stamp,
      :payment_way,
      :created_at,
      :version,
      :concepts
    )

    validates_presence_of(
      :expedition_place,
      :payment_method,
      :proof_type,
      :total,
      :subtotal,
      :currency,
      :certificate,
      :certificate_number, 
      :stamp,
      :payment_way,
      :created_at,
      :version
    )

    def initialize(params = {})
      super
      @concepts = []
    end
  
    def transmitter=(data)
      data = Entity.new(data) unless data.is_a? Entity
      @transmitter = data
    end

    def receptor=(data)
      data = Entity.new(data) unless data.is_a? Entity
      @receptor = data
    end

    def concepts=(data)
      @concepts = []
      if data.is_a? Array
        data.map do |c|
          c = Concept.new(c) unless c.is_a? Concept
          @concepts << c
        end
      elsif data.is_a? Hash
        @concepts << Concept.new(data)
      elsif data.is_a? Concept
        @concepts << data
      end
      @concepts
    end

    def taxes=(data) 
        data.is_a?(Taxes) ? data : Taxes.new(data)
        @taxes = data
    end

  end
end