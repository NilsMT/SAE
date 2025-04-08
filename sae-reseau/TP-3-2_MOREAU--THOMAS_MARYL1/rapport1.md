# Information sur le groupe

Noms : Bastian Mary, Nils Moreau--Thomas

groupe de TP : 3-2

X : 169

SECRET : alphacassiopeabetagruis

# Plan d'addressage

![plan d'adressage](https://media.discordapp.net/attachments/1115525603534323804/1121181207913316543/aled.drawio.png?width=665&height=627)

# Table de routages

## Client
| Adresse/réseau | Passerelle | Interface |
| ------ | ----- | ----- |
| 172.20.169.0/24 | - | VLAN_169 |
| 192.168.0.0/24 |  172.20.169.3/24 | VLAN_169 |
## DHCP
| Adresse/réseau | Passerelle | Interface |
| ------ | ----- | ----- |
| 172.20.169.0/24 | - | VLAN_169 |
| 192.168.0.0/24 |  172.20.169.3/24 | VLAN_169 |
## Routeur
| Adresse/réseau | Passerelle | Interface |
| ------ | ----- | ----- |
| 192.168.0.0/24 | - | jaune |
| 172.20.169.0/24 | - | VLAN_169 |
## SMTP
| Adresse/réseau | Passerelle | Interface |
| ------ | ----- | ----- |
| 192.168.0.0/24 | - | jaune |
| 172.20.169.0/24 | 192.168.0.169/24 | jaune |

## DNS (Supposée)
| Adresse/réseau | Passerelle | Interface |
| ------ | ----- | ----- |
| 192.168.0.169/24 | - | jaune |
| 172.20.169.0/24 | 192.168.0.169/24 | jaune |

# Les commandes

## Client
On lance un démon qui va gérer le VLAN

    modprobe 8021q

On créer un VLAN

    ip link add link jaune name VLAN_169 type vlan id 169

On rejoins ce VLAN

    ip a add 172.20.169.1/24 dev VLAN_169

Puis on active l'interface du VLAN

    ip link set up dev VLAN_169

On ajoute une route pour savoir comment accéder au réseau **192.168.0.0** (via **172.20.169.3** au travers de l'interface VLAN_169)

    ip r add 192.168.0.0/24 via 172.20.169.3 dev VLAN_169

## Routeur
On lance un démon qui va gérer le VLAN

    modprobe 8021q

On créer un VLAN

    ip link add link jaune name VLAN_169 type vlan id 169

On rejoins ce VLAN

    ip a add 172.20.169.3/24 dev VLAN_169

On ajoute notre adresse IP qui sera connu pour les machines en dehors du VLAN et dans le réseau **192.168.0.0**

    ip a add 192.168.0.169/24 dev jaune

Puis on active l'interface du VLAN

    ìp link set up dev VLAN_169

On active ensuite le transfert de paquet à une autre machine (on sert d'intermédiaire)

    echo 1 > /proc/sys/net/ipv4/ip_forward
<br>

    sysctl -p

Puis on défini comment atteindre les différents réseaux depuis le routeur

    ip r add 192.168.0.0/24 via 192.168.0.169
<br>

    ip r add 172.20.169.0/24 via 172.20.169.3

## SMTP
On écrit dans /etc/resolv.conf l'adresse du serveur DNS

    nameserver 192.168.0.254

On retourne dans le terminal pour y ajouté une route vers notre réseau et le VLAN

    ip r add 192.168.0.0/24 dev jaune
<br>

    ip r add 172.20.169.0/24 via 192.168.0.169

On regarde quel adresse IP peut être assigné à notre machine

    host smtp169.mail169.com

Et on l'assigne à notre machine  

    ip a add [adresse que la commande d'avant à renvoyer] dev jaune

# Analyse capture de trame

## Analyse capture de trames - VLAN

![](https://cdn.discordapp.com/attachments/1115525603534323804/1118112817661354014/vlancap.png)

Nous pouvons voir que 172.20.169.2 recherche quel machine est le serveur (172.20.169.254) qui est donc trouvé à la machine 04:8d:38:c2:57:e8.
<br>
<br>
Ensuite il y a des échanges par le protocole ICMP (pour Internet Control Message Protocol).
Ces échanges sont structurés d'une manière spécifique, nous allons donc décomposé la première requête ICMP :

Cette trame fait tout d'abord 98 octets et elle provient de la machine **172.20.169.1** et est à destination de **172.20.169.2**. elle a été réalisé en 11 milisecondes environ

La catégorie "info" contient plus d'informations sur la trame et est structuré comme cela :

- Identifiant : 0x11cf
Il s'agit de l'identifiant unique de la requête ICMP. Il permet d'associer la demande de ping à la réponse correspondante.

- Séquence : 1/256
La séquence est un numéro qui permet de suivre l'ordre des requêtes et des réponses dans une série de pings. Dans ce cas, la séquence est 1 et le numéro maximum est 256.

- TTL (Time To Live) : 64
Le TTL indique le nombre maximal de routeurs que le paquet peut traverser avant d'être abandonné. Dans ce cas, le TTL est de 64, ce qui signifie que le paquet peut passer par un maximum de 64 routeurs avant d'être abandonné.

- Temps de réponse attendu : 4
Cela indique que le temps de réponse attendu pour cette requête ICMP est de 4 unités de temps (peut être des millisecondes). Cela permet de mesurer la latence entre l'envoi de la requête et la réception de la réponse correspondante.

Puis il y a une réponse qui est structuré de la même manière

## Analyse capture de trames - DNS

![](https://cdn.discordapp.com/attachments/1115525603534323804/1121164235154653214/image.png)

Après avoir fait la commande

     host smtp169.mail169.com
Le serveur SMTP fait une demande d'adresse au DNS pour son domaine qui, rappellons-le, est **smtp169.mail169.com**. Le serveur DNS est situé à l'adresse **192.168.0.254** et le protocole utilisé est donc "DNS" (pour Domain Name System).
Dans la section "info" nous avons des informations concernant le domaine demandant une adresse IP: 

    Standard query 0xd2aa A smtp169.mail169.com.
Cela précise que la requête est standard (ce n'est donc pas une réponse) qui à l'identifiant **0xd2aa** et la requête est réalisé pour trouver une adresse IP au site **smtp169.mail169.com**.
Ensuite comme la trame précédente la taille y est, ici elle est de 79 octet pour la première
<br>

Puis le serveur DNS, identifié par la nom de domaine **A.ROOT-SERVERS.NET** avec pour adresse **192.168.0.254**, répond à la requête en y donnant l'adresse ip **192.168.0.69** pour le domaine **smtp169.mail169.com**

## Analyse capture de trames - Routage

![](https://cdn.discordapp.com/attachments/1115525603534323804/1121402907091284068/image.png)

Les trames présentés utilise le protocole ICMP (pour Internet Control Message Protocol) et représente une série de ping entre la machine SMTP (**192.168.0.69**) et la machine CLIENT (**172.20.169.1**). On remarque les mêmes types d'informations que la première capture analysée, l'identifiant est cette fois ci : 0x1148. Mais un point important c'est le TTL. On remarque que quand un requête de ping trouve une réponse, le TTL est passé de 64 à 63. Cela s'explique par le passage via le routeur, sachant que le TTL décrémente quand le paquet passe à travers un routeur, en l'occurence **172.20.169.3**. pour ce qui est des autres éléments, ils ont déjà été décrit à la première capture.