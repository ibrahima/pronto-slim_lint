# frozen_string_literal: true

require 'pronto'
require 'slim_lint'
require 'slim_lint/runner'

module Pronto
  # Pronto runner for the SlimLint linter
  class SlimLint < Runner
    def run
      return [] unless @patches

      @patches.select { |patch| patch.additions.positive? }
              .select { |patch| slim_file?(patch.new_file_full_path) }
              .map { |patch| inspect(patch) }
              .flatten.compact
    end

    def inspect(patch)
      runner = ::SlimLint::Runner.new
      lints = runner.run(files: [patch.new_file_full_path.to_s]).lints
      lints.map do |lint|
        patch.added_lines.select { |line| line.new_lineno == lint.line }
             .map { |line| new_message(lint, line) }
      end
    end

    def new_message(lint, line)
      path = line.patch.delta.new_file[:path]

      Message.new(path, line, lint.severity, lint.message, nil, self.class)
    end

    def slim_file?(path)
      '.slim' == File.extname(path)
    end
  end
end
