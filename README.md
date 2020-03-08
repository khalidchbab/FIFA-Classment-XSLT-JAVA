# FIFA-Classment-XSLT-JAVA
Transformer un fichier XML qui contient des joueurs de football avec leur classement FIFA (jeu vidéo), à une fichier HTML pour les afficher d’une manière ordonnée dynamiquement on utilise XSLT.

Comment ça marche : 
L’application est une petite application JAVA SE qui prends deux fichiers source le premier est le fichier XML qui contient les données sur nos joueurs, et un fichier XSLT qui contient des instructions pour la transformation de fichier XML. Puis on le transforme à un fichier HTLML qui contient une partie header Hero image et bouton, et partie corps qui se compose de plusieurs cartes générer pour chaque joueur parmi les joueurs de XML.


Structure d’application JAVA :
 	
L’application se compose d’une seule package principale nommer com.khalid.NoSQL qui contient :
images : tous les images qu’on a utilisé dans l’application
Main : class principale qui se charge de lire les fichier XML et XSLT et les Transformer en HTML.
Players.xml : fichier qui contient les informations sur nos joueurs.
Players.xsl : fichier XSL qui se charge de déterminer la manière de générer le fichier HTML.






Fichier XML : Players.xml

Le fichier XML contient une balise racine/root <Players>. Cette balise contient lui-même un nombre des joueurs <Player>. On constate que chaque joueur à plusieurs attributs comme le nom, âge et l’équipe mais aussi il a une balise <Picture> qui contient l’URL/Lien d’une image, et aussi <stats> qui est un URL/Lien au classement officiel de FIFA.


Fichier XSLT : players.xsl
 	

La fichier XSLT contient des balises spéciales comme : 
<xsl :template match= />
Définit un moyen de réutiliser les modèles afin de générer la sortie souhaitée pour les nœuds d'un type/contexte particulier (/ = nœud racine).

Page HTML contient le CSS entre des balises <Style>.


Les balises XSLT utilisé : 
<xsl:for-each select="Players/Player"> : la balise boucle, pour chaque joueur parmi l’ensemble des joueurs.
<xsl:sort select="rank"/> : la balise qui se charge de trier les joueurs selon un attribut qui le rank ou la classe.
<xsl:value-of select="picture"/> : la balise qui se charge de récupérer les informations depuis XML.
Fichier Main : 
 

Le fichier Main.java contient une classe qui se compose deux fonctions :
Main : fonction principale d’application. Point de départ d’application
converXMLToHtml : fonction de transformations de fichier XML source à un fichier HTML à travers fichier XSLT.
Page HTML :











La page consiste d’une partie HERO avec une image et un Button vers le site official de classement, et des cartes des joueur. Chaque carte se compose de deux faces. Le front est l’image des joueurs et le classement, l’arrière contient des informations et le lien vers le classement et quelque informations détaillés sure les joueurs.
