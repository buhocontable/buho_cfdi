require 'active_model'

module BuhoCfdi
  class BaseNode
    include ActiveModel::Validations
    attr_accessor :node_hash

    def initialize(params = {})
      @node_hash = {}

      params.each_pair do |key, value|
        if respond_to? key
          instance_variable_set("@#{key}", value)
        end
      end
    end

    def to_hash
      self.class.params.each do |param|
        node_hash[define_locale(param)] = send(param)
      end

      node_hash
    end

    private

    def define_locale(param)
      I18n.t("nodes.#{self.class.name.demodulize.underscore}.#{param}")
    end

    class << self
      def attr_accessor(*args)
        @params ||= []
        @params.concat(args)
        
        super(*args)
      end

      def params
        @params
      end
    end
  end
end