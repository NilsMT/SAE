# Information sur le groupe

Noms : Bastian Mary, Nils Moreau--Thomas

groupe de TP : 3-2

X : 169

SECRET : alphacassiopeabetagruis

# Manuel Utilisateur sur l'installation d'un DHCP

Tout d'abord, il faut aller sur le PC qui se verra utilisé le serveur DHCP, nous allons donc choisir le PC Client (172.20.169.1) et lui retiré son adresse IP :

	ip a del 172.20.169.1/24 dev VLAN_169 

Ensuite il faut préciser sur quel interface le serveur DHCP va distribué ses adresses IP, nous pouvons le préciser dans le fichier /**etc/default/isc-dhcp-server**. Il faut donc ouvrir ledit fichier :

	nano /etc/default/isc-dhcp-server

Puis y écrire :

	INTERFACESv4="VLAN_169"

Ensuite nous allons modifier un 2ème fichier pour déclaré comment la distribution d'adresse IP s'organise, cela est décrit dans le fichier **/etc/dhcp/dhcpd.conf**. Donc nous l'ouvrons en faisant

	nano /etc/dhcp/dhcpd.conf
Puis on y écrit :

	option domain-name "alphacassiopeabetagruis.org";
	option domain-name-servers 192.168.0.0;

	subnet 172.20.169.0 netmask 255.255.255.0 {
	range 172.20.169.4 172.20.169.254;
	option routers 172.20.169.3;
	option domain-name "alphacassiopeabetagruis.org";
	option domain-name-servers 192.169.0.0;
	}

Cela va nous assurer de : 
- distribuer des adresses IP de **172.20.169.4** à **172.20.169.254**
- de les distribué par le biais du routeur **172.20.169.3** au réseau **172.20.169.0** avec un masque de **255.255.255.0**
- de créé un domaine sur le réseau **192.169.0.0** avec l'URL **alphacassiopeabetagruis.org** 

Maitenant que la configuration est faite, nous allons vérifier l'état du serveur avec la commande suivante :

	service --status-all 
On remarque que le serveur n'est pas actif, il ne fonctionne pas. Il faut donc le démarrer avec la commande

	service isc-dhcp-server start
Cela lance le service **isc-dhcp-server** qui correspond au service qui gère le DHCP

<br>
De retour sur le Client, nous allons désormais declaré que son adresse IP sera attribué par le DHCP situé dans le **VLAN_169**

	dhclient VLAN_169

Nous pouvons désormais constaté que le Client à bel et bien reçu une adresse ip en faisant
	ip a

à la ligne qui contient "inet", elle même en dessous de celle contenant "VLAN_169@jaune" il y a l'adresse ip de notre Client

Nous pouvons aussi remarqué que par l'utilisation de

	ip r
il y a une route par défaut qui s'est ajouté :

	default via 172.20.169.3 dev VLAN_169

Cela signifie que tous les paquets n'ayant pas une destination connu de la machine sera renvoyé vers **172.20.169.3**, ce qui correspond à notre routeur

# Analyse capture de trames

## Analyse capture de trames - DHCP

![](https://cdn.discordapp.com/attachments/1115525603534323804/1121409144205877280/image.png)

On remarque ici, que les trames communiquent avec le protocole DHCP (pour Dynamic Host Configuration Protocol ). Ce protocole permet d'assigner automatiquement une configuration ip aux machines sans configuration dans l'endroit ou le service du DHCP est disponible.
Sur la première trame, on remarque qu'un serveur DHCP a été découvert, cela signifie que le DHCP est opérationnel.
Ensuite nous voyons une trames qui "offre" une configuration IP à une machine et lui "offre" l'adresse IP **172.20.169.4**.
cette requête est suivi d'un trame qui transmet la configuration IP à la machine qui à désormais l'adresse **172.20.169.4**. Cette capture est cloturé par un acquittement qui accuse du succès de l'échange entre la machine sans adresse IP et le serveur DHCP