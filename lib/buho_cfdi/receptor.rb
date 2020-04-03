module BuhoCfdi
  class Receptor < BaseNode
    attr_accessor(
      :rfc,
      :business_name,
      :use_cfdi
    )

    validates_presence_of(
      :rfc,
      :business_name,
      :use_cfdi
    )

    def to_x
      {Rfc: @rfc, Nombre: @business_name, UsoCFDI: @use_cfdi}
    end

  end
end