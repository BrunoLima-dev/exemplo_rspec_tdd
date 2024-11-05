# Webmock gem
require 'vcr'
require 'webmock/rspec'
require 'capybara/rspec'
require 'capybara/rails'

# Configura o VCR para gravar as requisições feitas para a API
VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.filter_sensitive_data('<API-URL>') { 'http://jsonplaceholder.typicode.com'}
end

RSpec.configure do |config|
  # Capybara
  config.include Capybara::DSL
  config.include Capybara::RSpecMatchers

  # FactoryBot
  config.before(:suite) do
    FactoryBot.lint
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end


  config.shared_context_metadata_behavior = :apply_to_host_groups
end
