namespace :db do
  desc 'Clears the database and then seeds it'
  task reseed: :environment do 
    Rake::Task["db:truncate"].invoke
    Rake::Task["db:seed"].invoke
  end

  desc 'Clears the database'
  task truncate: :environment do 
    puts "Truncating database"
    ActiveRecord::Base.connection.
      tables.
      reject {|t| t =~ /ar_internal_metadata|schema_migrations/}.
      map do |t|
        putc "."
        command = "TRUNCATE TABLE #{t} RESTART IDENTITY CASCADE"
        ActiveRecord::Base.connection.execute(command)
      end
    puts
  end
end