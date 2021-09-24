class AdSerializer
  attr_reader :ad

  def self.serialize_collection(collection)
    collection.map do |obj|
      new(obj).to_json
    end
  end

  def initialize(ad)
    @ad = ad
  end

  def to_json(*_args)
    {
      id: ad.id,
      title: ad.title,
      text: ad.text,
      user_id: ad.user_id,
      lat: ad.lat,
      lon: ad.lon,
      created_at: ad.created_at
    }
  end
end
