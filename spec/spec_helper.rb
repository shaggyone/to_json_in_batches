require 'rubygems'
require 'bundler/setup'
require 'active_record'
require 'to_json_in_batches' # and any other gems you need

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')
load File.expand_path File.join(__FILE__, '../support/schema/schema.rb')

require File.expand_path File.join(__FILE__, '../support/models/tested.rb')

RSpec.configure do |config|
end
