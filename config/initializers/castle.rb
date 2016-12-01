class Castle
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, response = @app.call(env)

    request = Rack::Request.new(env)

    if env['PATH_INFO'] == '/users/sign_in' && request.request_method == 'POST'

      # castle.authenticate('login')
      # if > 0.3
      #   set cookie ('need auth')

      # same for logout

      [423, headers, response]
    else
      [status, headers, response]
    end
  end
end

# regexp defines logged in area; /users/*
# if castle token (session) isn't present, you'll be logged out
# token is a JWT, containing challengeRequired
# token with challengeRequired can only be used once, then logged out
# token is used by JS to fetch more about the state.
