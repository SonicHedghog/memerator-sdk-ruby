# A profile is a user, but has more details.
# Usually, only the authenticated user can see these.
class Memerator::Profile < Memerator::User
  # @!visibility private
  def initialize(data, token: nil)
    @data = data
    @token = token
  end

  # @return [Time, nil] the time when your Pro subscription expires, if you have one
  def pro_expires
    Time.parse(@data['pro']['expires'])
  end

  # @return [Time, nil] the time when your Pro subscription started, if you have one
  def pro_since
    Time.parse(@data['pro']['since'])
  end

  # Update your Bio!
  # @return [true] the success
  def bio=(new_bio)
    response = JSON.parse(RestClient.post("https://memerator.me/api/v1/profile/me", { "bio" => new_bio }.to_json, Authorization: @token, 'Content-Type': :json))
    @data['bio'] = new_bio
    response['success']
  end
end
