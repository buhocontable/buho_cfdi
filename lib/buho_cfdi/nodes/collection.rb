module Nodes
  class Collection
    attr_accessor :_collection, :klass

    def initialize(klass)
      @klass = klass
      @_collection = []
    end

    def all
      _collection
    end

    def add(params)
      instance = klass.new(params)
      _collection << instance

      instance
    end
  end
end