# frozen_string_literal: true

# Monkey patch escape to handle non-UTF8 strings
# TODO: upstream this
module Prometheus
  module Client
    module Formats
      module Text
          def self.escape(string, format = :doc)
            string.to_s.gsub(REGEX[format], REPLACE)
          rescue => e
            raise "error escaping string: #{string.inspect} (#{e.to_s})\n#{e.backtrace.join('\n')}"
          end
      end
    end
  end
end
