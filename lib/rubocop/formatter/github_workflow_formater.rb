# frozen_string_literal: true

module RuboCop
  module Formatter
    # This formatter displays just a list of the files with offenses in them,
    # separated by newlines. The output is machine-parsable.
    #
    # Here's the format:
    #
    # /some/file
    # /some/other/file
    class FileListFormatter < BaseFormatter
      def file_finished(file, offenses)
        return if offenses.empty?
        
        offenses.each do |offense|
          output.printf(
            "::error file=%<file>s,line=%<line>s,col=%<column>s::%<cop_name>s: %<message>s\n",
            file: file,
            line: offense.location.line,
            column: offense.location.column,
            cop_name: offense.cop_name,
            message: offense.message
          )
        end
      end
    end
  end
end
