# Data types et data structure

Dans un premier temps tu vas nouveaux ajouter le pragma


```
pragma solidity ^0.6.4;
```

Sans oublier la nomination du smart contrat dans ce cas on va appelée NameAll.

```
pragma solidity ^0.6.4;

contract NameAll {
}
```

tu va maintenant crée la premiere structure de NameAll. On va simplement ajouté nos données via un string et la nomination _fristName et _lastName

```
pragma solidity ^0.6.4;

contract NameAll {
    struct Person {
    string _firstName;
    string _lastName;
}
}
```
 par la suite tu va crée une fonction qui permet d'envoyer les prénoms et nom mais aussi  le compteur de personne à chaque ajout, une personne sera ajouté au compteur 

```
pragma solidity ^0.6.4;

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

Maintenant tu va ajouter le compteur en cache. celui-ci opermet de savoir le nombre de personne et également combien de fois nous devons appeler la fonction people() pour obtenir chaque personne

```
pragma solidity ^0.6.4;

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

# Cartographie


La structure de donnée de solidity ce base sur la cartographie ce qui permet de stocker des paires de clé-valeur. ceet structure fonctionne comme un tableau de hachage sur d'autres fonctions.

```
pragma solidity ^0.6.4;

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

tu va légerement modifier ce code afin d'obtenir le comptag de maniere plus efficace. maintenant le cache du compteur peopleCount créer un identifiant pour la personne. Ensuite, il instancie une nouvelle structure de personne avec l'id et les attributs passés. Il l'ajoute ensuite à la cartographie des personnes

```
pragma solidity ^0.6.4;

contract NameAll {
    uint256 peopleCount = 0;

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