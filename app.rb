require 'sinatra'
require "sinatra/json"
require 'we_whisper'
require 'json'

class App < Sinatra::Base
  configure do
    set :wechat_decoder, WeWhisper::Whisper.new(
                           ENV['WECHAT_APPID'],
                           ENV['WECHAT_TOKEN'],
                           ENV['WECHAT_APPSECRET'],
                           assert_signature: false
                         )
  end

  get '/' do
    json({ status: :success })
  end

  post '/decode' do
    content = params["content"]
    result = settings.wechat_decoder.decrypt_message(content)
    json({ status: :success, result: result})
  end
end
