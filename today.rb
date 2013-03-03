#!/usr/bin/env - ruby
#

require 'rubygems'
require 'mechanize'
require 'uri'
# require 'awesome_print'
require 'sinatra'

get '/today' do
  redirect today()
end


def today
  base_url = 'http://www.bbc.co.uk/programmes/b006qj9z/episodes/player'
  uri = URI.parse( base_url )


  agent = Mechanize.new
  page = agent.get( base_url )

  # ap page.links_with(:href => '/programmes/' )

  # The URLs are 'mm/dd/yyyy' so look for '/'
  todays_programme = page.link_with(:text => /\d\d\/\d\d\/\d\d\d\d/, :href => %r{/programmes/})

  return "#{uri.scheme}://#{uri.host}" + todays_programme.href
end
