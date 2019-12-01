RSpec.configure do |config|
  config.use_transactional_fixtures = false

  config.before(:suite) do |example|
    if !example.metadata[:skip_cleaner]
      DatabaseCleaner.clean_with :truncation
    end
  end

  config.before(:each) do |example|
    if !example.metadata[:skip_cleaner]
      if Capybara.current_driver == :rack_test
        DatabaseCleaner.strategy = :transaction
      else
        DatabaseCleaner.strategy = :deletion
      end

      DatabaseCleaner.start
    end
  end

  config.append_after(:each) do
    DatabaseCleaner.clean
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
