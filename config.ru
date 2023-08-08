# This file is used by Rack-based servers to start the application.
$stdout.sync = true

require_relative 'config/environment'

run Rails.application
