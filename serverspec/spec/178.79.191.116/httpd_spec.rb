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

describe file('/etc/nginx/conf.d/devops.conf') do
  it { should be_file }
  it { should contain "proxy_pass http://localhost:1234;" }
  it { should contain "proxy_redirect off;" }
end
