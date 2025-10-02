# This file is used by Rack-based servers to start the application.
# require "hanami/boot"
require_relative "config/environment"
# Hanami.app.router(inspector: OasHanami::Inspector.new) # set before run the app.

# run Hanami.app
run Rails.application
Rails.application.load_server
