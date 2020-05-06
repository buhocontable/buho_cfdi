module BuhoCfdi
  class CancellationBuilder

    attr_accessor :params, :cancellation

    def initialize(params)
      @params = params
      build_cancellation
      cancellation
    end

    def build_cancellation
      if params.include?(:cancellation)
        @cancellation = ::Nodes::Cancellation.new params.fetch(:cancellation)

        if params.include?(:cancellation) && params.fetch(:cancellation).include?(:uuid_attributes)
          cancellation.build_children ::Nodes::Uuid

          params.fetch(:cancellation).fetch(:uuid_attributes).each do |params|
            cancellation.nodes_uuid.add params
          end
        end

        cancellation
      else
        nil
      end
    end
  end
end