module Memerator::Errors
  # Raised if a selected meme is Invalid.
  # Probably means it doesn't exist.
  class InvalidMeme < ArgumentError; end

  # Raised if your token sucks
  class InvalidToken < ArgumentError; end

  # Raised if the meme status didn't really change
  class NoChange < StandardError; end

  # Raised if you don't have access to the requested resource
  class NoPermission < StandardError; end
end
