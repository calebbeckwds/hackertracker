namespace :backups do
  desc "Make postgres drop the base"
  task :postgres => :environment do
    print User.all.to_yaml
    puts
    print Payment.all.to_yaml
  end
end
