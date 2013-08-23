require 'spec_helper'

describe user('devops') do
  it { should exist }
  it { should have_login_shell '/bin/bash' }
  it { should have_home_directory '/home/devops' }
end

describe group('devops') do
  it { should exist }
end

