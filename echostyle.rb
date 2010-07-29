APP_ROOT = File.expand_path(File.dirname(__FILE__))

require 'rubygems'
require 'sinatra'
require 'sass'

set :root, APP_ROOT

post '/' do
  scss = request.body.read.to_s
  default_options = Sass::Engine::DEFAULT_OPTIONS.dup
  default_options.delete(:syntax)
  options = {:syntax => :scss}.merge(default_options)
  engine = Sass::Engine.new(scss, options)
  root = engine.to_tree
  root.render
end
