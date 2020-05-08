# La base

Dans notre premier contrat nous allon voir comment retournée un "hello world"

Pour cela je vais vous montrez comment on retour une valeur.
dans le smartcontrat firstcontrat.sol vous allez voir une mauvaise maniere de proceder et dans value.sol la bonne maniere.


Dans un premier temps nous avons déclare notre smart contrat et ç version de langage

```
pragma solidity ^0.6.4;
```

 # Pragma

 *pragma* est littéralement un mot clé utilisée permet d'activer certaines fonctionnalité ou verification du compilateur sont utilisation est néssaire et oid setre presant dans tout les fichiers en .sol cependant si vous importé un fichier sont n'activation n'est pas obligatoire penser à verifier si il est present lors de modification en local


 Maintenant nous allons  nomée notre smart contrat


```
pragma solidity ^0.6.4;
contrat Value {
    //  le code est ici
}
```

Un smart contrat est une "piece de code" qui permet d'éxucuté  des fonction en API sur le web. Tous ce que vous codé pour le smart contrat est visible par tout le monde et cela permet à tout le monde de ce connecter au smart contrat afin qu'il utilise les diverse fonctions

Dans notre smart contrat nous allons  programer  le stokage d'information ce smart contrat ce découpe en deux point :

- Stocker une valeur
- Récupérer cette valeur

bien maintenant nous allons crée un stokage pour "value"

```
pragma solidity ^0.6.4;
contrat Value {
    string value; 
}
```

la variable appellée ici est " state variable" elle permet de persité les informations dans la blockchain. A chaque requete effectuer la valeur est en registré dans la blockchain.