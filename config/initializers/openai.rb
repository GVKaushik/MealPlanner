require "dotenv/load"
require "openai"
::OPENAI_CLIENT = OpenAI::Client.new(:access_token=>ENV.fetch("OPENAI_API_KEY"))
