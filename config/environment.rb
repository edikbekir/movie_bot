require 'active_record'
require 'rake'
require 'bundler/setup'
require 'pg'
require 'rss'
require 'rubygems'
require 'yaml'
require 'byebug'

ActiveRecord::Base.establish_connection(
  adapter: "postgresql",
  database: "telegram_db",
  pool: "5",
  timeout: "5000",
  host: "localhost",
  username: "postgres",
  password: "edikbekir"
)
