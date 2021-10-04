module Nodes
  class Deductions < ::BuhoCfdi::BaseNode
    attr_accessor(
      :total_other_deductions,               # TotalOtrasDeducciones          -   required
      :total_taxes_detained,                 # TotalImpuestosRetenidos        -   required
    )

    validates_presence_of(
      :total_other_deductions, 
      :total_taxes_detained
    )
  end
end