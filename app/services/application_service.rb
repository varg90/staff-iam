# frozen_string_literal: true

class ApplicationService
  include Dry::Monads[:do, :result, :maybe, :try]

  def call(*)
    Failure(:not_implemented)
  end
end
