require 'spec_helper'

describe package('nginx') do
  let(:path) { '/sbin:/usr/sbin' }
  it { should be_installed }
end

describe service('nginx') do
  let(:path) { '/sbin:/usr/sbin' }
  it { should be_enabled   }
  it { should be_running   }
end

describe port(80) do
  it { should be_listening }
end

describe port(1234) do
  it { should be_listening }
end

describe file('/etc/nginx/conf.d/devops.conf') do
  it { should be_file }
  it { should contain "server {" }
  it { should contain "listen 80;" }
  it { should contain "server_name _;" }
  it { should contain "access_log /var/log/nginx/devops-access.log;" }
  it { should contain "location / {" }
  it { should contain "proxy_pass http://localhost:1234;" }
  it { should contain "proxy_redirect off;" }
end

