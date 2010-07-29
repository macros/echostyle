APP_ROOT = File.expand_path(File.dirname(__FILE__))

require 'rubygems'
require 'sinatra'
require 'sass'

set :root, APP_ROOT

post '/' do
  scss = request.body.read.to_s
  engine = Sass::Engine.new(scss, :syntax => :scss, 
                            :style => :compact,
                            :load_paths => ['css'],
                            :cache_location => 'cache')
  engine.render
end
