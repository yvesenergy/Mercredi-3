require 'google_drive'
require 'open-uri'
require 'rubygems'
require 'nokogiri'
require 'json'

session = GoogleDrive::Session.from_config("config.json")


$:.unshift File.expand_path("./../lib", __FILE__)
# require 'lib/scrapper'
require 'scrapper'
Ville_email.new.emails('val-d-oise')

# création json
hash_to_json = Ville_email.new.show_mail
File.open("db/emails.JSON","w") do |f|
  f.write(hash_to_json.to_json)
end

