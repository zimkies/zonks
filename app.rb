Bundler.require

require 'sinatra/asset_pipeline'

class App < Sinatra::Base
  register Sinatra::AssetPipeline

  get '/api/v1/awards' do
    awards.find.to_a.map { |a| from_bson_id(a) }.to_json
  end

  post '/api/v1/awards/' do
    award_oid = awards.insert(JSON.parse(request.body.read.to_s))
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
      Mongo::Connection.new 'mongo-zonks'
    end
  end
end
