require 'active_record'
require 'rake'
require 'bundler/setup'
require 'pg'
require 'rss'
require 'rubygems'
require 'yaml'
require 'byebug'
require 'themoviedb-api'
require_relative 'environment'
require 'dotenv'
Dotenv.load


ActiveRecord::Base.establish_connection(
  adapter: "postgresql",
  database: "telegram_db",
  pool: "5",
  timeout: "5000",
  host: "localhost",
  username: "postgres",
  password: "edikbekir"
)
PROJECT_ROOT = File.absolute_path("../..", __FILE__)

models_path = PROJECT_ROOT + "/models/**/*.rb"
Dir.glob(models_path).each { |f| require f }

lib_path = PROJECT_ROOT + "/lib/*.rb"
Dir.glob(lib_path).each { |f| require f }

Tmdb::Api.key(ENV['Tmdb_key'])
Tmdb::Api.language("ru")
