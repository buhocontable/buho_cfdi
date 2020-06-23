module Nodes
  class EmploymentSubsidy < ::BuhoCfdi::BaseNode
    attr_accessor(
      :subsidy_caused,                      # SubsidioCausado   -   required
    )

    validates_presence_of(
      :subsidy_caused
    )
  end
end