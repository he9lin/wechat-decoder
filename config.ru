require 'rubygems'
require 'bundler'
Bundler.require

require './app'

use Rack::PostBodyContentTypeParser
run App
