# Data types et data structure

Dans un premier temps tu vas de nouveau ajouter le pragma


```
pragma solidity ^0.6.10;
```

Sans oublier la nomination du smart contrat dans ce cas on va appelée NameAll.

```
pragma solidity ^0.6.10;

contract NameAll {
}
```

Tu vas maintenant crée la première structure de NameAll. Tu vas simplement ajouté tes données via un string et avec la nomination _fristName et _lastName

```
pragma solidity ^0.6.10;

contract NameAll {
    struct Person {
    string _firstName;
    string _lastName;
    }

}
```
Par la suite tu crées une fonction qui permet d'envoyer les prénoms et nom mais aussi le compteur de personne à chaque ajout, une personne sera ajoutée au compteur.

```
pragma solidity ^0.6.10;

contract NameAll {
    Person[] public people;


    struct Person {
    string _firstName;
    string _lastName;
}

function addPerson(string memory _firstName, string memory _lastName) public {
    people.push(Person(_firstName, _lastName));
    peopleCount += 1;
    }

}
```

Maintenant tu vas ajouter le compteur en cache. Celui-ci permettant de savoir le nombre de personnes et également combien de fois nous devons appeler la fonction people() pour obtenir chaque personne.

```
pragma solidity ^0.6.10;

contract NameAll {
    Person[] public people;

    uint256 public peopleCount;

    struct Person {
    string _firstName;
    string _lastName;

    }

function addPerson(string memory _firstName, string memory _lastName) public {
    people.push(Person(_firstName, _lastName));
    peopleCount += 1;
    }

}
```

## Cartographie


La structure de donnée de solidity se base sur la cartographie ce qui permet de stocker des paires de clé-valeur. Cette structure fonctionne comme un tableau de hachage sur d'autres fonctions.


```
pragma solidity ^0.6.10;

contract NameAll {
    Person[] public people;

    uint256 public peopleCount;

    mapping(uint => Person) public people;

    struct Person {
    string _firstName;
    string _lastName;
    }

function addPerson(string memory _firstName, string memory _lastName) public {
    people.push(Person(_firstName, _lastName));
    peopleCount += 1;
    }

}
```

Tu vas légèrement modifier ce code afin d'obtenir le comptage de manière plus efficace. Maintenant le cache du compteur peopleCount créer un identifiant pour la personne. Ensuite, il instancie une nouvelle structure de personne avec l'id et les attributs passés. Il l'ajoute ensuite à la cartographie des personnes.

```
pragma solidity ^0.6.10;

contract NameAll {
    uint256 peopleCount = 0;

    mapping(uint => Person) public people;

    struct Person {
    uint _id;
    string _firstName;
    string _lastName;
    }

function addPerson(string memory _firstName, string memory _lastName) public {
    people.push(Person(_firstName, _lastName));
    peopleCount += 1;
    }

}
```

Super, tu peux compiler ton code !