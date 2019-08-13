# frozen_string_literals: true

 # Monkey patch escape to handle non-UTF8 strings
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
