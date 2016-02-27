set :stage, :production

# Replace 127.0.0.1 with your server's IP address!
server '52.77.242.29', user: 'deploy', roles: %w{web app}