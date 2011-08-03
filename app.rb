#!/usr/bin/env ruby
$:.unshift File.dirname(__FILE__)

require 'yaml'
require 'mongoid'
require 'match'
require 'guess'

Mongoid.database = Mongo::Connection.new('localhost','27017').db('botliga')

token_list = YAML.load_file('tokens.yml')
puts token_list.inspect
bot_token = token_list['bot1']

(1..1).each do |group|
	matches = Match.where(:group => group)
	
	matches.each do |match|
		guess = Guess.new
		result = guess.result
		puts "#{match.matchId} #{match.hostName} - #{match.guestName}, #{match.hostGoals}:#{match.guestGoals}"
		puts "#{match.matchId}, #{result}, #{bot_token}"
		#puts ApiClient.post_to_api(match.matchId, result, bot_token)
	end
	puts 
	puts "----------------------------------------------------------------------"
	puts
end