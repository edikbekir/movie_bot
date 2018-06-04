require_relative '../config/environment.rb'

class Genre < ActiveRecord::Base
  has_and_belongs_to_many :films
end
