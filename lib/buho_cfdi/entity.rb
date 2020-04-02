module BuhoCfdi
  class Entity < BaseNode
    attr_accessor(
      :rfc,
      :business_name,
      :fiscal_regime,
      :use_cfdi
    )

    validates_presence_of(
      :rfc,
      :business_name
    )
  end
end