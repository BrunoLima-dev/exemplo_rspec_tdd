# Webmock gem
require 'vcr'
require 'webmock/rspec'
require 'capybara/rspec'
require 'selenium/webdriver'

# Configura o VCR para gravar as requisições feitas para a API
VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.filter_sensitive_data('<API-URL>') { 'http://jsonplaceholder.typicode.com'}

  config.ignore_request do |request|
    # VCR ignore qualquer requisição cujo URI contenha "googlechromelabs".
    request.uri =~ /googlechromelabs/
    # VCR ignore localhost
    config.ignore_localhost = true
    # VCR ignore certas requisições quando nenhuma cassete está ativa
    config.allow_http_connections_when_no_cassette = true
  end
end
# Configura o Capybara para simular o navegador Chrome
Capybara.register_driver :selenium_chrome_headless do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--headless')
  options.add_argument('--no-sandbox')
  options.add_argument('--disable-gpu')
  options.add_argument('--disable-dev-shm-usage') # Adicione esta linha
  options.add_argument('--window-size=1366,720')

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.javascript_driver = :selenium_chrome_headless

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
