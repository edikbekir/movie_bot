require_relative '../config/environment.rb'

class Film < ActiveRecord::Base
  has_and_belongs_to_many :genres
end