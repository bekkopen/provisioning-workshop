Oppsummering:

* Server-klient modell. Man kan sette opp Chef server selv, eller la Opscode hoste serveren via produktet Enterprise Chef.

* Man setter opp cookbooks og recipes i repo på utviklermaskin ("Workstation" i Chef-lingo). 

* Man laster opp cookbooks til Chef server vha. verktøyet knife. 

* Man bruker knife for å bootstrappe en node. Kjører kommando med hostnavn, passord og "run-list" som angir hvilke cookbooks som skal installeres på noden.

* `knife bootstrap` laster ned `chef-client` på noden, henter ned cookbooks og nodens run-list fra Chef-serveren og provisjonerer opp noden.

* Senere runs initieres ved å kjøre "chef-client" på noden, enten ved å manuell SSH til noden eller via Knife.

* Endringer i cookbooks gjøres ved å endre lokalt, commite til repo og laste opp cookbooken til Chef server vha. Knife. `chef-client` kjøres for å synkronisere cookbooken til noden og utføre eventuelle endringer. 

* Endringer i en nodes run list, altså hvilke recipes som skal kjøres på noden, gjøres med "knife node run_list add/remove [cookbook]", eller via Enterprise Chef management konsollet på web. 

* Man installerer cookbooks i lokalt repo med "knife cookbook site install -b <branch>". Dette laster ned cookbooken fra Opscode Community i en egen chef-vendor-<cookbook> branch og merger den inn i <branch>. Du kan gjøre endringer i cookbooken selv, committe til eget repo og laste opp til egen Chef server. Din tilpassede versjon av cookbooken er da den som installeres på nodene som bruker den. For å hente ned upstream endringer i cookbooken kan man oppdatere chef-vendor-branchen og merge endringene inn i master.

For å kjøre eksempelet:

* Installer Chef på egen maskin som beskrevet her: https://learnchef.opscode.com/quickstart/workstation-setup/

* Logg inn på https://manage.opscode.com/organizations, og last ned knife config. Gå på https://www.opscode.com/account/password og last ned key (.pem-fil).
  Legg .pem-fila og knife.rb inn i chef/.chef

* `cd chef`

* `vagrant up`

* `knife bootstrap localhost --ssh-user vagrant --ssh-password vagrant --ssh-port 2222 --run-list "recipe[bekk-devops],recipe[apt],recipe[java],recipe[nginx]" --sudo`

* Det er mulig du må kjøre `knife node delete devops-chef` for å fjerne noden fra serveren hvis den allerede er registrert fra noen andres kjøring.  
