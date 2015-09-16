#!/usr/bin/env ruby

require 'json'
require 'pp'

# # given JSON: {"data":{"url":"https://foo.bar/baz.boo","id":1}}}
# $ curl localhost:4000/foo/1 | xargs -0 ./json.rb data url
# https://foo.bar/baz.boo

str, keys = ARGV.pop, ARGV || []

json = JSON.parse str.chomp

unless keys.empty?
  while key = keys.shift
    json = json[key]
  end
end

pp json
