Ansible howto
=============

1. Edit ```hosts``` to be your machine
1. Run ```ansible-playbook play.yml``` to provision



Ansible pros/cons
=============

Pros

1. Krever ingen installert programvare på remote-maskin
1. Bruker python, som er standard-vare på de fleste distroer
1. ```YAML```-konfigurasjon
1. Kan deklarativt håndtere events med egendefinerte ```handlers```
1. Lett å finne best-practices og strukturere script/kode

Cons

1. Stótter ikke legacy-OS (windows)
1. Har ikke abstrahert bort package management, du må spesifikt invoke ```yum``` eller ```apt``` eller annet..

Nóytralt/Uvisst

1. Lener seg mot RHEL/CentOS
1. Vet ikke hvor lett det er å skrive egne moduler?
1. Stóttet av en organisasjon med penger
1. ```GPL```-lisens
