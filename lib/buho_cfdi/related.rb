module BuhoCfdi
  class Address < BaseNode
    attr_accessor(
      :uuid
    )

    validates_presence_of(
      :uuid
    )
  end
end