<img src="https://www.univ-nantes.fr/medias/photo/logotype-nantes-u-noir-72dpi_1638965800927-png?ID_FICHE=1482184" alt="Nantes Université" width="200"/>
<img src=../pictures/LOGO_PRINCIPAL_IUT_NANTES_CMJN.png alt="IUT Nantes" width="200"/>

# Mini-projet de GPO2 d'année BUT1-Info 2023 (SAE 2.5): APPLICATION INTELLIGENTE DE SUIVI DE L'ASTHME CHEZ L'ADOLESCENT

L’asthme est une maladie chronique inflammatoire qui se caractérise par une réactivité excessive des bronches à certains facteurs déclenchant comme l’exercice physique, et qui provoque une difficulté à respirer. Cette maladie apparaît généralement pendant l’enfance. Elle possède une origine multifactorielle tels que des facteurs environnementaux (exposition au tabac, à des allergènes comme les acariens ou les moisissures, à la pollution de l’air, etc.), les émotions, l'activité physique, etc. 
L’asthme est sous-diagnostiqué et insuffisamment traité. Il représente une lourde charge pour les individus et les familles et limite souvent l’activité du malade tout au long de sa vie. Selon l'Organisation Mondiale de la Santé, cette affection touche un peu plus de 5 % des habitants de la planète, soit environ 300 millions de personnes (environ la population des États-Unis). L'asthme touche en France 3,5 millions de personnes, dont un tiers a moins de quinze ans (soit environ 1,2 millions de personnes). Et en moins de vingt ans, le nombre d'asthmatiques a augmenté de plus de 40 % chez les adolescents, soit environ 23 200 personnes asthmatiques de
plus chaque année, ce qui représente pendant 20 ans près de 464 000 adolescents de plus.

On se place dans le contexte d'un projet de Recherche & Développement. L'objectif étant d'avoir une approche multi-factorielle de l'asthme en prenant en compte les facteurs environnementaux (pollution atmosphérique / domestique, CO2, humidité,etc.), physiologiques (taux oxygène dans le sang, etc.) et comportementaux (activité physique, prise de Ventoline, etc.). Cela sera fait par des mesures complètes réalisées au moyen de capteurs (IoT) et de questionnaires au sein d'une application mobile, et à l'aide d'algorithme prédictifs utilisant l'Intelligence Artificielle. L'application développée doit être en mesure d'offrir au patient un suivi adapté grâce à une prévention personnalisée et ciblée des crises, favorisant ainsi une meilleure observance de son traitement. L'application développée donnera aussi aux praticiens (généraliste, spécialiste, urgentiste) des indications précieuses pour un meilleur suivi et un meilleur diagnostique.

Dans la SAE 2-05, nous allons traiter la première partie du projet en mettant en oeuvre l'ensemble du contenu de la ressource R210-GPO2 et en produisant un cahier des charges.

Imaginons que votre groupe (**au plus 5 personnes**) est la première équipe de l'entreprise qui va faire toute l'étude et qui confiera ensuite le cahier des charges à une équipe chargée de faire un prototype (il s'agit d'un projet classique pour des étudiants de 2ème année l'an prochain).

## Cas d'étude

**Description du projet :** 

Ce projet se concrétisera sous la forme d'une application mobile qui devra :
* Collecter des données
  * environnementales à l'aide de capteurs (dispositif à placer sur la bretelle d'un sac à dos par exemple) pour mesurer pollution, pollens...
  * physiologiques à l'aide de capteurs (montre connectée, patch connecté...) pour mesurer des constantes comme le rythme cardiaque, la respiration, le taux d'oxygène dans le sang, etc.
  * comportementales à l'aide de capteurs sur des dispositifs (spiromètre connecté, bronchodilatateur connecté) pour mesurer la prise de traitement, à l'aide de capteurs pour mesurer l'activité physique (smartphone, bracelet connecté), à l'aide de questionnaires sur l'application pour collecter des données de vie réelle (ressenti après prise de traitement ou après crise exacerbation...)
* A partir de ces données 
  * Fournir un tableau de bord à destination des professionnels de santé sur l'état de santé de l'adolescent par rapport à son asthme (prise de traitement, crises, etc.)
  * A partir d'algorithmes d'apprentissages, établir un profil de survenue de crise d'asthme et prévenir en amont l'adolescent
  * Alerter l'adolescent en cas de rupture de parcours de soin (non suivi régulier du traitement par exemple)
  * Fournir des informations d'éducation thérapeuthique
  * Envoyer les données sur l'Espace Numérique de Santé
  * Garantir le respect des règles édictées par le RGPD sur les données de santé

Cette application est un cas d'IA embarquée sur une application mobile. Il ne devra pas y avoir de serveurs collectant la moindre donnée, hormis l'Espace Numérique de Santé du patient concerné (https://www.monespacesante.fr/). Tout devra se faire en local en assurant sécurité et confidentialité.

Ce projet relève directement de la conception d'un dispositif médical. En ce sens, il doit répondre à un nombre conséquent de règles (dont le RGPD sur les données de santé) sur les dipositifs médicaux : https://ansm.sante.fr/documents/reference/reglementation-relative-aux-dispositifs-medicaux-dm-et-aux-dispositifs-medicaux-de-diagnostic-in-vitro-dmdiv/logiciels-et-applications-mobiles-en-sante

** Données à collecter obligatoirement **

Vous aurez à collecter plusieurs données importantes au moyen de capteurs. En voici une première liste, que vous pourrez potentiellement compléter :
* Oxymétrie (saturation en O2 dans le sang) 
* Rythme cardiaque
* Température corporelle
* Température ambiante
* Taux d’humidité
* Taux de COVs atmosphérique (concentration en COVs)
* Taux de CO2 atmosphérique (concentration en CO2)
* Taux d’O3 atmosphérique (concentration en ozone)

** Quelques projets connexes **

*Ventoline connectée*
* https://detours.canal.fr/ventoline-connectee-va-epoustoufler-asthmatiques/
* https://www.interaction-healthcare.com/actualites/connectinh-le-premier-inhalateur-connecte-pour-accompagner-les-patients-dans-le-controle-de-lasthme-et-des-malades-respiratoires/
* https://business.ladn.eu/news-business/actualites-startups/airnest-linhalateur-connecte-pour-asthmatiques/
* https://www.edimark.fr/ers/2019/ej/inhalateur-connecte-ameliorer-adherence-ff-vi-asthme
* https://www.sciencesetavenir.fr/sante/allergies/asthme-des-inhalateurs-et-aerosols-connectes-dans-un-futur-proche_30319

*Applications*
* https://www.ameli.fr/assure/sante/themes/asthme-vivre-maladie/asthmactiv-la-visite-guidee
* https://www.lequotidiendumedecin.fr/specialites/pediatrie/efficasthme-lappli-pour-apprendre-aux-parents-gerer-les-crises-dasthme-de-lenfant
* https://www.sciencesetavenir.fr/sante/e-sante/effic-asthme-application-mobile-pour-l-asthme-des-enfants_131497
* https://sante-digitale.fr/asthmacrise-lapplication-pour-les-patients-asthmatiques/
* https://mymhealth.com/myasthma
* https://www.pulmonologyadvisor.com/advisor-channels/asthma-advisor-channel/5-must-have-apps-for-patients-with-asthma/
* https://woodruffmedical.edu/the-best-mobile-apps-to-recommend-to-your-asthma-patients/
* https://pubmed.ncbi.nlm.nih.gov/?term=asthma+%22mobile+application%22

*Qualité de l'air*
* https://www.dyson.fr/newsroom/guides/qualite-de-l-air/pollution-de-l-air-a-paris-avec-laury-thilleman
* https://www.pocket-lint.com/fr-fr/gadgets/actualites/dyson/147481-sac-a-dos-dyson-surveille-la-qualite-de-l-air-pour-signaler-les-polluants-que-respirent-les-enfants-de-londres/

*Projets similaires (à compléter)*
* https://www.annabernbaum.com/afflo

*RGPD (données de santé)*
* https://www.cnil.fr/fr/quest-ce-ce-quune-donnee-de-sante
* https://www.cnil.fr/fr/traitement-de-donnees-de-sante-comment-informer-les-personnes-concernees

*Divers*
* Agence du Numérique en Santé : https://esante.gouv.fr/
* Site sur l'asthme et les allergies : https://asthme-allergies.org/
* Association Santé respiratoire : https://sante-respiratoire.com/les-maladies-respiratoires/asthme/
* Association des asthmatiques sévères : https://asthmatiques-severes.fr/
* Les écoles de l'asthme : https://asthme-allergies.org/liste-officielle-ecoles-de-lasthme-france/


## Déroulement du travail.

Le travail à réaliser ici correspond au **WP0*, le premier workpackage du projet, celui qui correspond à la rédaction du cahier des charges et plus tard à la gestion du projet.

Vous devrez mettre en oeuvre l'ensemble des techniques vues en GPO2 en produisant un cahier des charges. C'est un travail réalisable en **60 heures.etudiants** (à répartir entre 5 étudiants et dont les 2/3 seront faites pendant des créneaux avec un enseignant).
La date de rendu est le **vendredi 2 juin 2023, à 19h**.

Votre travail sera à rendre dans gitlab, l'enseignant récupérera votre travail à cette date. Même si vous faites quelque chose ensuite, il peut choisir la version qu'il évalue. Si vous avez vraiment besoin qu'il considère une version en retard, il faudra lui demander et il y aura des pénalités (comme dans tout projet industriel, à savoir 1 point par jour de retard).

Nous préférons mettre une note par groupe, mais nous aurons accès à votre travail individuel et des disparités anormales seront prises en compte. **Merci d'indiquer à la fin de votre document ce que chacun a fait avec son volume horaire**.

Vous allez utiliser les outils vues en TD (youtrack et les outils de uncloud.univ-nantes.fr : traitement de texte, tableur, diagramme, mindmap/WBS) pour faire votre étude, mais le rendu se fera dans un fichier du même type que celui que vous êtes en train de lire : au format markdown (https://support.zendesk.com/hc/fr/articles/4408846544922-Formatage-de-texte-avec-Markdown#topic_xqx_mvc_43__row_ppv_wln_1n). Il s'agit d'un langage basique pour mettre en forme du texte grâce à des caractères spéciaux (cela à l'avantage d'être du texte brut facilement versionnable avec git).

Dans les "files" du "repository", vous trouverez un dossier cahier_des_charges. S'y trouve un fichier préformé de cahier des charges, nommé *cahier_des_charges.md*. Ce sera à vous de le modifier et de le versionner dans votre propre projet gitlab une fois que vous aurez fait un fork de ce projet (comme déjà fait en TD de GPO2 : un étudiant fait le fork et ajoute les autres membres de l'équipe, le chargé de séance et M. Mottu en Maintener).

**A la fin des séances SAE** votre enseignant pourra vous demander de commenter votre travail et répondre à des questions (des modalités vous seront données en séance).

## Contraintes ##

Il s'agit d'un projet réel de e-santé. Vous serez jugé sur le sérieux de votre travail, sur la qualité de votre analyse et de votre proposition. Vous pouvez bien entendu utiliser chatGPT à condition :
* de citer les parties qui auront été réalisées avec cet outil
* de vous en servir pour apporter une réelle plus-value à votre projet
* d'apporter obligatoirement votre plus-value humaine à ce projet
Vous pouvez l'utiliser pour résumer des contenus ou pour avoir des idées que vous développerez ensuite dans votre projet... Utilisez-le intelligemment comme appui et non pour faire le travail à votre place. Pensez toujours à bien poser le contexte et lui donner un rôle d'expert avant de lui poser des questions. 

Vous devrez dans tous les cas maitriser ce que vous écrivez ; l'exercice oral et les questions que nous vous poserons auront pour objet de vérifier cette maîtrise.

Votre état de l'art (étude de l'existant, sur l'asthme etc.) devra **obligatoirement** être sourcé, c'est-à-dire que nous devrons avoir les références que vous aurez trouvées.

La note sera individuelle.
