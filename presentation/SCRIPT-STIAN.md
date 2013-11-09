Ansible
=======

* cat hosts
  - Vise at her legger man til grupper av hosts
* cat play.yml
  - Vise hvordan roller tildeles forskjellige hosts
* cat roles/webserver/tasks/main.yml
  - Inkludere andre filer. Er veldig fil-orientert
* cat roles/webserver/tasks/deployer.yml
* cat roles/webserver/tasks/install_nginx.yml
* ansible-playbook play.yml


Puppet
======

* ssh root@puppet.devops.smat.cc
* cd /etc/puppet
  - Her ligger alle configfilene
  - Ulempe: Må kopeiere de over selv
* tail manifests/site.pp
  - Her starter all bootstrappingen med Master/Slave
* vim manifests/httpserver.pp
  - Gå kort igjennom puppet-config
  - require og notify
  - Rekkefølgen har ikke noe å si
* sudo service puppet start
* less /var/log/messages
  - Se at ting skjer


Chef
====

* knife bootstrap chef.devops.smat.cc --ssh-user root 
  - Enkelt å kjøre opp nye noder
* knife node show chef.devops.smat.cc
  - Status på noden
* knife node run_list add chef.devops.smat.cc "recipe[bekk-devops],recipe[yum],recipe[java],recipe[nginx]"
  - Legg til oppskrifter som den noden skal ha
* knife node show chef.devops.smat.cc
  - Da er det lastet opp til master-serveren
* ssh root@chef.devops.smat.cc chef-client
  - Kjør klienten på serveren
