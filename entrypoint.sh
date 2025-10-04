#!/bin/bash
# entrypoint.sh

# Kill any existing Rails server process
pkill -f 'rails s'

# Start Rails server in the background
RAILS_ENV=development bin/thrust bin/rails s -b 0.0.0.0 &

# Run RSpec tests
RAILS_ENV=test bundle exec rspec -f documentation

# Keep the container running and watch for changes
tail -f /dev/null
