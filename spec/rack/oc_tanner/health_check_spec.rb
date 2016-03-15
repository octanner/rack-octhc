require 'spec_helper'

def make_env(path = '/octhc', params = {})
  {
    'REQUEST_METHOD' => 'GET',
    'PATH_INFO' => path,
    'rack.session' => {},
    'rack.input' => StringIO.new('test=true')
  }.merge(params)
end

describe Rack::OCTanner::HealthCheck do
  let(:app) { lambda { |env| [200, env, []] }}
  let(:options) { {} }
  let(:middleware) { Rack::OCTanner::HealthCheck.new(app) }
  let(:expected_response) { [200, {'Content-Type' => 'text/html'}, ['overall_status=good']] }

  subject{ middleware }

  describe '#initialize' do
    it 'assigns the app instance variable' do
      expect(subject.app).to eq(app)
    end
  end

  describe '#call' do
    it 'lets non-health check URLs pass through' do
      env = make_env('/some/other/path')
      expect(app).to receive(:call).with(env)
      subject.call(env)
    end

    it 'returns with expected response' do
      caller = Rack::Test::Session.new(Rack::MockSession.new(app))
      expect(subject.call(make_env)).to eq(expected_response)
    end

    it 'returns with expected response' do
      expect(subject.call(make_env)).to eq(expected_response)
    end
  end
end