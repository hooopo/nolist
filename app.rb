# -*- encoding : utf-8 -*-
require 'sinatra'
require 'incoming'

get '/' do
  'Hello world!'
end

post '/emails' do
  "OK"
end
