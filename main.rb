require 'active_record'
require 'pg'
require 'colorize'
require_relative 'contact'
require_relative 'application'







# Establish a connection to the database
#(requires internet since it's on heroku!)
# Note: You'll want to put in your own heroku creds


puts "Establishing connection to database ..."
ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  encoding: 'unicode',
  pool: 5,
  database: 'dbleig8drng1kg',
  username: 'tsqwdzhlytorsd',
  password: 'oatP7E7mN_il98jygj8lWupgAg',
  host: 'ec2-54-221-243-6.compute-1.amazonaws.com',
  port: 5432,
  min_messages: 'error'
)


puts "CONNECTED"

puts "Setting up Database (recreating tables) ..."


puts "CONNECTED"

puts "Setting up Database (recreating tables) ..."

if !ActiveRecord::Base.connection.table_exists? 'contacts'
  ActiveRecord::Schema.define do
    drop_table :contacts
      create_table :contacts do |c|
      c.column :first_name, :string
      c.column :last_name, :string
      c.column :email, :string
      c.column :phone, :integer
      c.timestamps
    end
  end
end

puts "Setup DONE"


Application.new.run






#
# begin
#   Application.new.run
# ensure
#   conn.close
# end
