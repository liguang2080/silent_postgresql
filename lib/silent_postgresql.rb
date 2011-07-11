if Rails.env.development? || Rails.env.test?

  module SilentPostgresql
    SILENT_METHODS = %w(tables table_exists? indexes column_definitions pk_and_sequence_for last_insert_id)

    def self.included(base)
      SILENT_METHODS.each do |m|
        base.send :alias_method_chain, m, :silencer
      end
    end

    class_eval <<-METHOD
      def shit
        "puts google"
      end
    METHOD

    SILENT_METHODS.each do |m|
      aliased_method, punctuation = m.gsub(/([?!=])$/, ''), $1
      class_eval <<-METHOD
      def #{aliased_method}_with_silencer#{punctuation}(*args)
        @logger.silence do
          #{aliased_method}_without_silencer#{punctuation}(*args)
        end
      end
      METHOD
    end
  end

  require "silent_postgresql/railtie"
end
