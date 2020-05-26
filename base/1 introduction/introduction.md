# La base

Dans notre premier contrat  tu vas voir comment retourner un "hello world"

Pour cela je vais te montrer comment on retourne une valeur.
Dans le smart contrat firstcontrat.sol tu vois une mauvaise manière de procéder et dans value.sol la bonne manière.

Dans un premier temps tu déclares le smart contrat et ça version de langage.

```
pragma solidity ^0.6.8;
```

Tu as également la possibilité d'englober les versions de solidity ce pendant je te conseille de ne JAMAIS dépasser un 0.X.X tu pourrais appelez des fonctions qui ne sont plus fonctionnelle.

Exemple avec memory qui a était implémenté dans la version 0.5.0 de solidity mais qui ne fonctionne pas sous la version 0.4.0


 ## Pragma

 *pragma* est littéralement un mot clé utilisée permet d'activer certaines fonctionnalités ou vérification du compilateur sont utilisation est nécessaire et dois être présent dans tous les fichiers en .sol cependant si tu importes un fichier sont activation n'est pas obligatoire pense à vérifier s’il est présent lors de modification en local. Si jamais tu fais des modifications l'information que pragma te donne est PRIMORDIAL, il te donne la version du langage, mais également le compilateur utilisé.


Maintenant, tu nommes le smart contrat le nom du smart contrat dois être en rapport avec sa fonctionnalité. Plus ton projet va être gros plus la bonne nomination est important.


```
pragma solidity ^0.6.4;
contrat Value {
    //  le code est ici
}
```

Un smart contrat est une "pièce de code" qui permet d'exécuter des fonctions en API sur le web. Tous ce que tu codes pour le smart contrat est visible par tout le monde et cela permet à tout le monde de se connecter au smart contrat afin qu'il utilise les diverses fonctions.

Dans notre smart contrat tu vas programmer le stockage d'information. Ce smart contrat se découpe en deux point :

- Stocker une valeur
- Récupérer cette valeur

Bien maintenant tu crées un stockage pour "value".


```
pragma solidity ^0.6.4;
contrat Value {
    string value; 
}
```

La variable appelée ici est " state variable" elle permet de persisté les informations dans la blockchain. À chaque requête effectuer la valeur est enregistré dans la blockchain.


Maintenant pour stoker la value tu as besoin de la fonction get():

```
pragma solidity ^0.6.4;
contrat Value {
    string value; 

    function get() {
    return value;
    }
}
```

Puis afin d'ajouter la visiblilité sur la blockchain tu ajoute la fontion public et également "string memory" string permet d'avoir l'adttribut et memory precise que l'on souhaite garder l'information en stock

```
pragma solidity ^0.6.4;
contrat Value {
    string value; 

    function get public view returns(string memory) {
    return value;
}
}
```

Cependant il te manques une fonction! Celle de récuperation des données stocké.


```
pragma solidity ^0.6.4;
contrat Value {
    string value; 

    function get public view returns(string memory) {
    return value;

    function set(string _value) public {
    value = _value;
}
}
```

Tu déclare d'abord la fonction du constructeur avec le mot-clé "constructor". Cette fonction n'est exécutée qu'une seule fois, à chaque fois que le smart contrat est déployé. Elle doit également avoir la visibilité publique.

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


Il nous reste plus que la compilation et notre code fonction !