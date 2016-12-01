class RecordingsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def record
    r = Recording.find_by(cookie: params['interaction']['cookieId'])

    if r.nil?
      r = Recording.new
      r.cookie = params['interaction']['cookieId']
      r.user_agent = params['interaction']['userAgent']
      r.stats = params['interaction']['stats'].to_json
      r.save!
    end

    if params['interaction']['stats']['done'] == 'true'
      r.stats = params['interaction']['stats'].to_json
      r.save!
    end

    head :ok
  end
end
