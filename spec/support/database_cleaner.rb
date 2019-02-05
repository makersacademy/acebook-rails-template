RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:deletion)
  end

  config.around do |example|
    DatabaseCleaner.start
    example.run
    DatabaseCleaner.clean
  end
end