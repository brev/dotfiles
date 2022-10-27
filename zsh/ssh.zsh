### ssh

if [ $(ssh-add -l | grep -c "The agent has no identities." ) -eq 1 ]; then
  if [ -f /mach_kernel ]; then
    ssh-add -k
 fi
fi

# if [ $(ssh-add -l | grep -c ".ssh/chef_west.pem" ) -eq 0 ]; then
#   ssh-add ~/.ssh/chef_west.pem
# fi
