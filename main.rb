# frozen_string_literal: true

require 'twitter'
require 'dotenv'

Dotenv.load

client =
  Twitter::REST::Client.new do |config|
    config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
    config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
    config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
    config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
  end

# require 'pry';binding.pry # for debug

puts client.lists
           .find_all { |list| list.name.match('Draw')  }
           .map(&:member_count)
           .sum
