# Fonction visible et modification du temps 


Parlons  des fonctions visible ! elle sont comme les fonction vpublic et internal. elle permette la logique incrémentation

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

maintenant tu dois ajouter le public interface pour les autres comptes et pour celà tu l'integre à addPerson()

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

tu ajoute le modificateur à la fonction addPerson() de sorte que seul le propriétaire puisse l'appeler. Pendant que je suis ici, je vais vous montrer comment je formatte mon code Solidity une fois que les fonctions commencent à prendre de l'ampleur, avec beaucoup d'arguments, de modificateurs, de visibilité, etc...

créer un nouveau modificateur qui utilise le temps pour illustrer un cas d'utilisation du temps dans Solidity. Nous allons créer un nouveau modificateur appelé onlyWhileOpen qui vérifiera que l'heure actuelle de la chaîne de blocs est postérieure à une heure que nous aurons spécifiée.

psui stocker le startTime avec cette variable d'état en secondes, car c'est ainsi que nous exprimons les horodatages dans Solidity.

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

tu peux utiliser [ ce site web](http://www.unixtime.fr/) pour générer un horodatage. Maintenant, crée un modificateur pour vérifier que l'heure de départ est passée

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
Parfait notre code fonctionne et ce base maintenat sur la date donnée !
