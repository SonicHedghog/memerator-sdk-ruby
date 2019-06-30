# A profile is a user, but has more details.
# Usually, only the authenticated user can see these.
class Memerator::Profile < Memerator::User
  # @!visibility private
  def initialize(data)
    @data = data
  end

  # @return [Time, nil] the time when your Pro subscription expires, if you have one
  def pro_expires
    Time.parse(@data['pro']['expires'])
  end

  # @return [Time, nil] the time when your Pro subscription started, if you have one
  def pro_since
    Time.parse(@data['pro']['since'])
  end
end
