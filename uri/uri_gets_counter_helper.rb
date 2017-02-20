def gets
  input_sample[@uri_gets_counter += 1]
end

RSpec.configure do |config|
  config.before { @uri_gets_counter = -1 }
  config.after  { @uri_gets_counter = -1 }
end
