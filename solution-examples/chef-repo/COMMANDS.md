
# Bootstrap
knife bootstrap chef.devops.smat.cc --ssh-user root 
# If key generation fails:
# -N chef
# Optionally add: --run-list "recipe[bekk-devops],recipe[yum],recipe[java],recipe[nginx]"

# Show info about node
knife node show chef.devops.smat.cc

# Add recipies to node
knife node run_list add chef.devops.smat.cc "recipe[bekk-devops],recipe[yum],recipe[java],recipe[nginx]"

# Show info about node
knife node show chef.devops.smat.cc


# Run Chef-client on server
chef-client


# Delete node
knife node delete chef.devops.smat.cc
