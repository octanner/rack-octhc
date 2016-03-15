class Rack::OCTanner::HealthCheck

  DEFAULT_HEALTH_CHECK_PATH = '/octhc'.freeze

  attr_reader :app

  def initialize(app)
    @app = app
  end

  def call(env)
    @env = env.dup
    return health_check_response if on_health_check_path?
    @app.call(@env)
  end

  private

  def on_health_check_path?
    current_path.casecmp(DEFAULT_HEALTH_CHECK_PATH) == 0
  end

  def current_path
    @env['PATH_INFO'].downcase
  end

  def health_check_response
    [200, {'Content-Type' => 'text/html'}, ['overall_status=good']]
  end
end
