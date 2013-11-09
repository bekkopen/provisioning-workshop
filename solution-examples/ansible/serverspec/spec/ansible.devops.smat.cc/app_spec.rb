require 'spec_helper'

describe file('/etc/init.d/devops') do
  it { should be_file }
  it { should contain "PID_FILE=/var/run/devops.pid" }
  it { should contain "APP_HOME=/home/devops" }
  it { should contain "APP_JAR=devops.jar" }
  it { should contain "LOGS=/var/log/devops" }
end
