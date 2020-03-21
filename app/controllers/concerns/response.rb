# frozen_string_literal: true

module Response
  # convert object to JSON for show errors in serializer
  def error_message(object)
    object.errors.as_json
  end
end
