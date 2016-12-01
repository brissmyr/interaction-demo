class RecordingsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def record
    r = Recording.where(cookie: params['interaction']['cookieId']).first_or_initialize
    r.user_agent = params['interaction']['userAgent']
    r.stats      = params['interaction']['stats'].to_json
    r.save!

    head :ok
  end
end
