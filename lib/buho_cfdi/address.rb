module BuhoCfdi
  class Address < BaseNode
    attr_accessor(
      :street,
      :street_number,
      :interior_number,
      :neighborhood,
      :location,
      :reference,
      :city,
      :state,
      :country,
      :zip_code
    )
  end
end