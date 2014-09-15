Bundler.require

require 'sinatra/asset_pipeline'

class App < Sinatra::Base
  register Sinatra::AssetPipeline

  helpers do
    def protected!
      return if authorized?
      headers['WWW-Authenticate'] = 'Basic realm="Restricted Area"'
      halt 401, "Not authorized\n"
    end

    def authorized?
      @auth ||=  Rack::Auth::Basic::Request.new(request.env)
      @auth.provided? and @auth.basic? and @auth.credentials and @auth.credentials == ['nat', 'zonks']
    end
  end

  get '/api/v1/awards' do
    awards.find.sort(created_at: -1).to_a.map { |a| from_bson_id(a) }.to_json
  end

  post '/api/v1/awards/' do
    protected!
    award = JSON.parse(request.body.read.to_s)
    award.merge!(created_at: Time.now)
    award_oid = awards.insert(award)
    "{\"id\": \"#{award_oid.to_s}\"}"
  end

  get '/zonks*' do
    haml :index
  end

  def awards
    db.collection('awards')
  end

  # utilities for generating/converting MongoDB ObjectIds
  def to_bson_id(id)
    BSON::ObjectId.fromstring(id)
  end

  def from_bson_id(obj)
    obj.merge(id: obj['_id'].to_s)
  end

  def db
    return @db if @db
    @db = if ENV['MONGOLAB_URI']
      uri = URI.parse(ENV['MONGOLAB_URI'])
      name = uri.path.gsub(/^\//, '')
      db = Mongo::Connection.new(uri.host, uri.port).db(name)
      db.authenticate(uri.user, uri.password)
      db
    else
      Mongo::Connection.new.db 'mongo-zonks'
    end
  end
end
