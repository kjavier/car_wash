Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec

    # Choose one or more libraries:
    with.library :active_record
    with.library :active_model
  end
end
