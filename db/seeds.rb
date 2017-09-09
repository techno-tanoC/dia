require 'factory_girl'
Dir[Rails.root.join('spec/factories/**/*.rb')].each { |f| require f }
Rake::Task['db:migrate:reset'].invoke
