set :stage, :production

# Replace 127.0.0.1 with your server's IP address!
server 'ec2-54-254-193-82.ap-southeast-1.compute.amazonaws.com', user: 'deploy', roles: %w{web app}