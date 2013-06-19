require 'spec_helper'

describe user('root') do
  it { should have_home_directory '/root' }
  it { should have_login_shell '/bin/bash' }
end

describe user('devops') do
  it { should exist }
  it { should have_login_shell '/bin/bash' }
  it { should have_home_directory '/home/devops' }
end

describe group('devops') do
  it { should exist }
end

describe user('www-data') do
  it { should exist }
  it { should have_home_directory '/var/www' }
  it { should have_login_shell '/bin/sh' }
end

describe group('www-data') do
  it { should exist }
end

