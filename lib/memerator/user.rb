# A user is a Memerator User. Data everyone (with a token) can access
class Memerator::User
  # @!visibility private
  def initialize(data)
    @data = data
  end

  # @return [String] the user's username
  def username
    @data['username']
  end

  # @return [Integer] the user's ID
  def id
    @data['id']
  end

  # @return [String] the user's bio
  def bio
    @data['bio']
  end

  # @return [true, false] the user's verification status
  def verified?
    @data['perks']['verified']
  end

  # @return [true, false] the user's staff member status
  def staff?
    @data['perks']['staff']
  end

  # @return [true, false] the user's translator status
  def translator?
    @data['perks']['translator']
  end

  # @return [true, false] the user's pro status
  def pro?
    @data['perks']['pro']
  end

  # @return [String] the user's profile link
  def link
    @data['permalink']
  end

  # @return [Time] the user's join time
  def joined
    Time.parse(@data['joined'])
  end
end
