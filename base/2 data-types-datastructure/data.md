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

