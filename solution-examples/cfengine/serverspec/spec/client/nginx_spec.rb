require 'spec_helper'

describe package('nginx') do
  it { should be_installed }
end

describe service('nginx') do
  it { should be_enabled   }
  it { should be_running   }
end

describe port(80) do
  it { should be_listening }
end

describe file('/etc/nginx/conf.d/devops.conf') do
  it { should be_file }
  it { should contain "server {
    listen 80;
    server_name _;
    access_log /var/log/nginx/devops-access.log;

    location / {
        proxy_pass http://localhost:1234;
        proxy_redirect off;
    }
}" }
end
