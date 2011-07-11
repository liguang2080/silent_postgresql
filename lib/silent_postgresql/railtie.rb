module SilentPostgres
  
  class Railtie < Rails::Railtie
    initializer "silent_postgres.insert_into_active_record" do
      ActiveSupport.on_load :active_record do
        begin
          puts "google"
          ActiveRecord::ConnectionAdapters::PostgreSQLAdapter.send(:include, SilentPostgres)
        rescue NameError
        end
      end
    end
  end

end
