# -*- encoding : utf-8 -*-
require 'sinatra/base'
require 'incoming'
require 'rest-client'

class EmailReceiver < Incoming::Strategies::Mailgun
  setup :api_key => ENV["mailgun_api_key"]

  def receive(mail)
    from_address = mail.from.to_a.first
    # to   = mail.to.to_a.first
    Maillist.add_list_member(from_address)
  end
end

class Maillist
  def self.add_list_member(address)
   ::RestClient.post("https://api:#{ENV['mailgun_api_key']}@api.mailgun.net/v2/lists/nolist@hooopo.mailgun.org/members",
      :subscribed => true,
      :address => address,
      :name => 'Bob Bar',
      :description => 'Developer',
      :vars => '{"age": 26}')
  end
end

class App < Sinatra::Base
  get '/' do
    begin
      results =  RestClient.get("https://api:#{ENV['mailgun_api_key']}@api.mailgun.net/v2/lists/nolist@hooopo.mailgun.org/members")
      items = JSON.parse(results)["items"]

      html = "<h1>List Members:</h1>" 
      html << items.map{|item| item["address"].sub(/\A(..)../, "\\1**")}.join("<br />")

      html << "<h1>Subscribe List:</h1>"
      html << "Send Email To: join-list@hooopo.mailgun.org"

      html << "<h1>Create Post In List:</h1>"
      html << "Send Email To: nolist@hooopo.mailgun.org"

      html << "<h1>Help:</h1>"
      html << "Send Email To: hoooopo@gmail.com"
    rescue
      "Net Exception! Please retry!"
    end
  end

  post '/emails' do
    if EmailReceiver.receive(request)
      "ok"
    else
      "rejected"
    end
  end
end
