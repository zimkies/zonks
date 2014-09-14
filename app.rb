Bundler.require

require 'sinatra/asset_pipeline'

class App < Sinatra::Base
  register Sinatra::AssetPipeline

  get '/' do
    haml :index
  end

  get '/api/v1/awards' do
    awards.find.to_a.map { |a| from_bson_id(a) }.to_json
  end

  post '/api/v1/awards/' do
    award_oid = awards.insert(JSON.parse(request.body.read.to_s))
    "{\"id\": \"#{award_oid.to_s}\"}"
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
    @db ||= ::Mongo::Connection.new.db("mongo-zonks")
  end
end
