module Query
    extend ActiveSupport::Concern
    include ActiveModel::Model

    attr_accessor :result

    module ClassMethods
        def call(args = {})
            new(**args).tap do |query|
                query.call if query.valid?
            end
        end
    end

    def call
        raise NotImplementedError
    end

    def success?
        errors.none?
    end
end
