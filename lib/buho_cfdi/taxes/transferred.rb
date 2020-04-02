module BuhoCfdi
  class Address < BaseNode
    attr_accessor(
      :base,
      :tax,
      :rate,
      :import,
      :factor_type
    )

    validates_presence_of(
      :base,
      :tax,
      :rate,
      :import,
      :factor_type
    )
  end
end