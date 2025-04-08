# Information sur le groupe

Noms : Bastian Mary, Nils Moreau--Thomas

groupe de TP : 3-2

X : 169

SECRET : alphacassiopeabetagruis

## Installer le serveur

Tous d'abord, il faut installer le serveur afin de pouvoir l'utiliser :

    apt-get update --allow-releaseinfo-change
    apt install postfix mailutils
Puis tapé Y et entrée
## Setup le serveur postfix

### Lancer la configuration

il faut lancer la fenêtre de configuration du serveur postfix si jamais elle ne s'est pas lancé avec la commande précédente :

    dpkg-reconfigure postfix

### Paramètre de la configuration

Voici les paramètres à rentrée dans l'ordre dans ladite fenêtre de configuration :

    Internet Site
    mail169.com
    mail169.com, localhost.localdomain, localhost
    mail169.com, localhost.localdomain, localhost
    Sélectionné Yes
    192.168.0.0/24
    0
    +
    Sélectionné ipv4

## Lancer le serveur postfix

On démarre le service postfix :

    service postfix start

Ensuite nous sommes prêt à l'utiliser

# Analyse capture de trames

## Analyse capture de trames - SMTP

![](https://cdn.discordapp.com/attachments/1115525603534323804/1121424981109260388/image.png)

Cette capture est réalisé avec le protocole SMTP (Pour Simple Mail Transfer Protocol) et modélise un envoie de mail depuis la machine CLIENT (**172.20.169.4**) vers le serveur SMTP (**192.168.0.69**).
Tout de suite on réalise que chaque commande effectué pour envoyer un mail est répertorié et est sujet à une trame.
la première correspond à la commande réaliser sur le CLIENT pour définir quel machine sera le destinataire (ici SMTP)

    nc 192.168.0.69
Qui démare la rédaction du mail via le terminal (et donc fait le lien avec postfix). <br>
 Ensuite la commande 

    ehlo 172.20.169.6
est aussi sujet à une trame, on précise de quel machine provient ce mail (ici CLIENT).<br>
Ensuite il y a une trame contenant des informations importantes et les voici expliquées :
PIPELINING : Il s'agit d'une technique qui permet à l'expéditeur d'envoyer plusieurs commandes SMTP avant de recevoir les réponses correspondantes. Cela permet d'améliorer l'efficacité et la rapidité de la communication SMTP.

SIZE : Indique la taille maximale des messages (en octets) que le serveur SMTP peut accepter. Dans cet exemple, la taille maximale est indiquée comme 10 240 000 octets (10 Mo).

VRFY : La commande VRFY est utilisée pour vérifier si une adresse e-mail spécifiée est valide sur le serveur SMTP distant.

ETRN : La commande ETRN est utilisée pour demander au serveur SMTP distant d'envoyer les e-mails en attente dans sa file d'attente.

STARTTLS : Indique que le serveur SMTP prend en charge le chiffrement TLS/SSL pour sécuriser la communication SMTP.

ENHANCEDSTATUSCODES : Cette fonctionnalité permet d'obtenir des codes de statut SMTP plus détaillés pour faciliter le suivi et la gestion des e-mails.

8BITMIME : Indique que le serveur SMTP prend en charge l'envoi et la réception de messages contenant des octets à 8 bits, ce qui permet de prendre en charge des caractères non-ASCII et des encodages spécifiques.

DSN : Acronyme de "Delivery Status Notification". Cette fonctionnalité permet au serveur SMTP de générer des notifications de remise pour les e-mails envoyés.

SMTPUTF8 : Indique que le serveur SMTP prend en charge l'utilisation de l'encodage UTF-8 pour les adresses e-mail et les contenus des messages.

CHUNKING : Cette fonctionnalité permet de diviser de gros messages en blocs plus petits (chunks) pour faciliter leur transmission.

<br>
Cette trame indique donc que le serveur SMTP distant prend en charge ces fonctionnalités cités ci-desssus.

Ensuite le mail provient de foo@mail169.com (un utilisateur de CLIENT) et bar@mail169.com sera le destinataire (un utilisateur de SMTP).

Puis vient la réception des données du mail : un **DATA fragment**
c'est ce que l'ont retrouve en bas de l'image :
**MOREAU--THOMAS, MARY, alphacassiopeabetagruis, 169**.

l'email est envoyé au serveur avec succès et sans aucun problèmes (**S: 250 2.0.0** indique que le serveur répond en citant que l'envoie au serveur est un succès) et va être traité sous l'identifiant **B103335988** pour être retransmis à l'utilisateur bar@mail169.com.