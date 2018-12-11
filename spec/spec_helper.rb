require 'awesome_print'
require 'rack/test'
require 'support/helpers'
require 'support/node'
require 'travis/yaml'
require 'travis/yaml/web'

RSpec.configure do |c|
  c.include Spec::Support::Hash
  c.include Spec::Support::Node
end

if ENV['STACKPROF']
  require 'stackprof'

  RSpec.configure do |c|
    c.before :suite do
      StackProf.start(
        mode: ENV['STACKPROF'].to_sym,
        interval: 1000,
        out: 'tmp/stackprof-cpu-myapp.dump',
        raw: true
      )
    end

    c.after :suite do
      StackProf.stop
      StackProf.results
    end
  end
end
