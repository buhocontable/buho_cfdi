module BuhoCfdi
  class Transmitter < BaseNode
    attr_accessor(
      :rfc,
      :business_name,
      :fiscal_regime
    )

    validates_presence_of(
      :rfc,
      :business_name,
      :fiscal_regime
    )

    def to_x
      {Rfc: @rfc, Nombre: @business_name, RegimenFiscal: @fiscal_regime}
    end

  end
end