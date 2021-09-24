class CreateAd
  attr_reader :ad

  def initialize(params)
    @ad = Ad.new(
      title: params[:title],
      text: params[:text],
      city: params[:city],
      lat: params[:lat].to_f,
      lon: params[:lon].to_f,
      user_id: params[:user_id],
      created_at: Time.now
    )
  end

  def call
    ad.save
  rescue StandardError
    false
  end
end
