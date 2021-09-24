require 'sinatra'
require 'sinatra/json'
require 'sequel'
require 'logger'

DB = Sequel.connect('mysql2://root@localhost:3306/ads')

if settings.development?
  require 'sinatra/reloader'
  DB.loggers << Logger.new($stdout)
  DB.sql_log_level = :debug
end

DIRECTORIES = %w[
  controllers
  models
  serializers
  services
].freeze

DIRECTORIES.each do |directory|
  Dir["#{__dir__}/#{directory}/*.rb"].each do |file|
    require_relative file
  end
end
