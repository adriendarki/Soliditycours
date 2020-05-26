# Fonction visible et modification du temps 


Parlons des fonctions visible ! Elles sont comme les fonctions public et internal. Elle permette la logique incrémentation.

```
contract NameAll {
    uint256  public peopleCount = 0;

    mapping(uint => Person) public people;

    struct Person {
        uint id;
        string _fristName;
        string _lastName;
    }

    function addPerson(string memory _firstName, string memory _lastName) public {
        peopleCount += 1;
        people[peopleCount] = Person(peopleCount, _firstName, _lastName);
    }

    function incrementCount() internal {
        peopleCount += 1;
    }
}
```

Maintenant tu dois ajouter le public interface pour les autres comptes et pour cela tu l'intègres à addPerson()

```
contract NameAll {
    uint256  public peopleCount = 0;

    mapping(uint => Person) public people;

    struct Person {
        uint id;
        string _fristName;
        string _lastName;
    }

    function addPerson(string memory _firstName, string memory _lastName) public {
    incrementCount()
    people[peopleCount] = Person(peopleCount, _firstName, _lastName);
}

    function incrementCount() internal {
        peopleCount += 1;
    }
}
```

Tu ajoutes le modificateur à la fonction addPerson() de sorte que seul le propriétaire puisse l'appeler. 

Créer un nouveau modificateur qui utilise le temps pour illustrer un cas d'utilisation du temps dans Solidity. Tu crées un nouveau modificateur appelé onlyWhileOpen qui vérifiera que l'heure actuelle de la chaîne de blocs est postérieure à une heure que nous aurons spécifiée.

Puis stocker le startTime avec cette variable d'état en secondes, car c'est ainsi que nous exprimons les horodatages dans Solidity.

``` 
contract NameAll {
    uint256  public peopleCount = 0;

    mapping(uint => Person) public people;

    uint256 openingTime = 1544613571;


    struct Person {
        uint id;
        string _fristName;
        string _lastName;
    }


    function addPerson(
    string memory _firstName,
    string memory _lastName
    )
    public onlyWhileOpen
      {
        incrementCount();
        people[peopleCount] = Person(peopleCount, _firstName, _lastName);
    }

    function incrementCount() internal {
        peopleCount += 1;
    }
}
```

Tu peux utiliser [ce site web](http://www.unixtime.fr/) pour générer un horodatage. Maintenant, crée un modificateur pour vérifier que l'heure de départ est passée.

```
contract NameAll {
    uint256  public peopleCount = 0;

    mapping(uint => Person) public people;

    uint256 openingTime = 1544613571;

    modifier onlyWhileOpen() {
        require(block.timestamp >= openingTime);
        _;
    }

    struct Person {
        uint id;
        string _fristName;
        string _lastName;
    }


    function addPerson(
    string memory _firstName,
    string memory _lastName
    )
    public onlyWhileOpen
      {
        incrementCount();
        people[peopleCount] = Person(peopleCount, _firstName, _lastName);
    }

    function incrementCount() internal {
        peopleCount += 1;
    }
}
```

Parfait notre code fonctionne et se base maintenant sur la date donnée !