Gem::Specification.new do |s|
    s.name        = 'mobbex_gateway'
    s.version     = '0.0.0'
    s.summary     = "Mobbex Subscriptions Broker"
    s.description = "Mobbex Subscriptions Broker"
    s.authors     = ["Daniel Seren"]
    s.email       = 'daniel.seren@outlook.com'
    s.files       = ["lib/mobbex_gateway.rb"]
    s.files      += Dir['lib/**/*.rb']
    s.homepage    = 'https://rubygems.org/gems/mobbex_gateway'
    s.license       = 'MIT'

    s.add_runtime_dependency 'net-http', '~> 0.1', '>= 0.1.1'
    s.add_runtime_dependency 'uri', '~> 0.10', '>= 0.10.1'
    s.add_runtime_dependency 'json', '~> 2.5', '>= 2.5.1'

end
