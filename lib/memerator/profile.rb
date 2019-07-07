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

  # Set your username
  # Username Requirements:
  #   Be between 2 and 32 characters.
  #   Not be in use
  #   Can't be only numbers
  #   Can't have special characters Allowed: (A-Z|a-z|0-9|_|.)
  # @return [true] if the username was changed
  # @raise [ArgumentError] if the requirements are not met
  def username=(new_username)
    response = JSON.parse(RestClient.post("https://memerator.me/api/v1/profile/me", { "username" => new_username }.to_json, Authorization: @token, 'Content-Type': :json))
    @data['username'] = new_username
    response['success']
  rescue RestClient::BadRequest => error
    why = JSON.parse(error.response.body)['error']
    raise ArgumentError, "Your username does not match the requirements! #{why}"
  end

  # Update your Bio!
  # @return [true] the success
  def bio=(new_bio)
    response = JSON.parse(RestClient.post("https://memerator.me/api/v1/profile/me", { "bio" => new_bio }.to_json, Authorization: @token, 'Content-Type': :json))
    @data['bio'] = new_bio
    response['success']
  end
end
