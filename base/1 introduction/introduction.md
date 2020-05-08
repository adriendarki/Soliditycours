# La base

Dans notre premier contrat nous allons voir comment retourner un "hello world"

Pour cela je vais vous montrez comment on retour une valeur.
Dans le smartcontrat firstcontrat.sol vous allez voir une mauvaise manière de procéder et dans value.sol la bonne manière.

Dans un premier temps nous avons déclaré notre smart contrat et ça version de langage

```
pragma solidity ^0.6.4;
```

 # Pragma

 *pragma* est littéralement un mot clé utilisée permet d'activer certaines fonctionnalités ou vérification du compilateur sont utilisation est néssaire et odois etre présent dans tout les fichiers en .sol cependant si vous importé un fichier sont n'activation n'est pas obligatoire penser à vérifier s’il est présent lors de modification en local


 Maintenant nous allons nommée notre smart contrat


```
pragma solidity ^0.6.4;
contrat Value {
    //  le code est ici
}
```

Un smart contrat est une "pièce de code" qui permet d'exécuter des fonctions en API sur le web. Tous ce que vous codez pour le smart contrat est visible par tout le monde et cela permet à tout le monde de se connecter au smart contrat afin qu'il utilise les diverses fonctions

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


Maintenant pour stoker la value  j'ai besoins de la fonction get():

```
pragma solidity ^0.6.4;
contrat Value {
    string value; 
    function get() {
    return value;
}
}
```

Puis afin d'ajouter la visiblilité sur la blockchain j'ajoute la fontion public et également "string memory" string permet d'avoir l'adttribut et memory precise que l'on souhaite garder l'information en stoque

```
pragma solidity ^0.6.4;
contrat Value {
    string value; 
    function get view returns(string memory) {
    return value;
}
}
```

Cependant il nous manque une fonction ! celle de récuperation des donnée stocké


```
pragma solidity ^0.6.4;
contrat Value {
    string value; 
    function get view returns(string memory) {
    return value;
    function set(string _value) public {
    value = _value;
}
}
```

Nous déclarons d'abord la fonction du constructeur avec le mot-clé "constructor". Cette fonction n'est exécutée qu'une seule fois, à chaque fois que le smart contrat est déployé. Elle doit également avoir la visibilité publique.

```
pragma solidity ^0.6.4;
contract Value {
    string value;

    constructor() public {
        value = "myValue";
    }


    function get() public view returns(string memory ){
        return value;
    }

    function set(string memory _value) public {
        value = _value;
    }
}
```


il nous reste plus que la compilation et notre code est fonctionnel !