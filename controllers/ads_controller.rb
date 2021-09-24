get '/ads' do
  ads = Ad.order(:created_at).limit(100)
  ads_json = AdSerializer.serialize_collection(ads)

  json(ads_json)
end

post '/ads' do
  result = CreateAd.new(body_to_json)

  if result.call
    ad_json = AdSerializer.new(result.ad)
    json(ad_json)
  else
    status 422
    json(errors: 'Unprocessable entity')
  end
end

def body_to_json
  JSON.parse(request.body.read, symbolize_keys: true)
rescue StandardError
  {}
end
