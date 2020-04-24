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
        node_hash[define_locale(param)] = send(param) unless send(param).blank?
      end

      node_hash
    end

    def build_child!(klass, params)
      node = klass.new(params)

      if node.valid?
        self.class.send(:attr_reader, klass.name.downcase.sub( '::', '_'))
        instance_variable_set("@#{klass.name.downcase.sub( '::', '_')}", node)
      else
        nil
      end
    end

    def build_child(params)
      node = self.class.new(params)

      if node.valid?
        self.class.send(:attr_reader, self.class.name.downcase.sub( '::', '_'))
        instance_variable_set("@#{self.class.name.downcase.sub( '::', '_')}", self.class.new)
      else
        nil
      end
    end

    def build_children(klass)
      self.class.send(:attr_reader, klass.name.downcase.sub( '::', '_'))

      instance_variable_set(
        "@#{klass.name.downcase.sub( '::', '_')}",
        ::Nodes::Collection.new(klass)
      )

      self
    end

    private

    def define_locale(param)
      I18n.t("nodes.#{self.class.name.demodulize.underscore}.#{param}")
    end

    class << self
      def build_child(params)
        node = self.new(params)

        if node.valid?
          self.class.send(:attr_reader, self.name.downcase.sub( '::', '_'))
          instance_variable_set("@#{self.name.downcase.sub( '::', '_')}", self.new)
        else
          nil
        end
      end

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