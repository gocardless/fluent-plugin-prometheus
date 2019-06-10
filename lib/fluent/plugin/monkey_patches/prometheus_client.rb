# frozen_string_literal: true

# Monkey patch escape to handle non-UTF8 strings
# TODO: upstream this
module Prometheus
  module Client
    module Formats
      module Text
          def self.escape(string, format = :doc)
            string.
              to_s.
              encode("UTF-8", undef: :replace, invalid: :replace).
              gsub(REGEX[format], REPLACE)
          end
      end
    end
  end
end
