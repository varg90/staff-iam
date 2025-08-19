# frozen_string_literal: true

class BaseService
  extend Dry::Initializer
  include Dry::Monads[:do, :result, :maybe, :try]

  def call(*)
    Failure(:not_implemented)
  end
end
