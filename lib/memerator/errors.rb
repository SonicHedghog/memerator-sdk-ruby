module Memerator::Errors
  # Raised if a selected meme is Invalid.
  # Probably means it doesn't exist.
  class InvalidMeme < ArgumentError; end
end
