namespace :backups do
  desc "Make postgres drop the base"
  task :postgres => :environment do
    DB_CONFIG = YAML::load(ERB.new(IO.read(File.join(RAILS_ROOT, 'config', 'database.yml'))).result)[RAILS_ENV]
    `export PGPASSWORD=#{DB_CONFIG['password']} && pg_dump #{DB_CONFIG['database']} -Fc --username=#{DB_CONFIG['username']} --host=#{DB_CONFIG['host']} `
  end
end
