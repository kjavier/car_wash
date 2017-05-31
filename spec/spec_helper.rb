require File.expand_path('../../config/environment', __FILE__)

require 'rspec/rails'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  
  config.before(:each, type: :view) do
    config.mock_with :rspec do |mocks|
      mocks.verify_partial_doubles = false
    end
  end

  config.after(:each, type: :view) do
    config.mock_with :rspec do |mocks|
      mocks.verify_partial_doubles = true
    end
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.infer_base_class_for_anonymous_controllers = false
  
  config.order = 'random'

  config.disable_monkey_patching!

  config.default_formatter = 'doc' if config.files_to_run.one?

  config.profile_examples = 10
end
