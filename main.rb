#!/usr/bin/env ruby
require_relative 'engine/repl'
game = Adventure::Engine::Repl.new
game.start
