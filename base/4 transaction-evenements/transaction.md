# transaction et  évenements


Dans cette partie tu va voir comment réalisée une fonction d'acceptation Ether ou tout simplement le principe de transaction. le smart contrat sera chargé d'émettre les jetons, de suivre le solde du compte et de transféré également les fonds de l'Ether vers une autre adresse de portefeuille.

Pour cela tu va crée une cartographie qui suivra la balance de jeton.

```
contract Transaction {
    mapping(address => uint256) public balances;

    }
}
```

Puis tu crée la fonction buyToken() qui va nous permettre d'incrémenté la balance ainsi que adresse pour acheter les jetons

```
contract Transaction {
    mapping(address => uint256) public balances;
    address payable wallet;

    }

    function buyToken() public {
    balances[msg.sender] += 1;
    }   
}
```

Maintenant, tu as besoin de crée la fonction de transféré. 

* wallet.transfer() a pour objectif de réaliser un transfère ether directement sur le portefeuille appeler.
* ms.value et msg.sender permette d'obtenir ma valeur de ether.
* payabale est utilisé pour que les comptes puissent envoyer de Ether lors de l'appel de la fonction.

```
contract Transaction {
    mapping(address => uint256) public balances;
    address payable wallet;

    }

    function buyToken() public payable{
    balances[msg.sender] += 1;
    wallet.transfer(msg.value);
    }   
}
```

Et tu ajoute maintant le contructeur pour permettre la modfication du payable 

```
contract Transaction {
    mapping(address => uint256) public balances;
    address payable wallet;

    }

    constructor(address payable _wallet) public {
        wallet = _wallet;
    }

    function buyToken() public payable{
    balances[msg.sender] += 1;
    wallet.transfer(msg.value);
    }   
}
```

par défaut tu aurais crée une fonction fallback pour etre sur d'envoyer ether au compte qui l'appel mais ça serais une énorme bétise et tu va choisir plus-tot la fonction receive() qui comme sont nom l'indique permet de recevoir 

```
contract Transaction {
    mapping(address => uint256) public balances;
    address payable wallet;

    }

    constructor(address payable _wallet) public {
        wallet = _wallet;
    }

    receive() external payable {
        buyToken();
    }

    function buyToken() public payable{
    balances[msg.sender] += 1;
    wallet.transfer(msg.value);
    }   
}
```

# Evenement


Les evenements ! Les événements sont un moyen de faire face à l'asynchrone de la chaîne de blocage. tu peux déclarer des événements à l'intérieur de smart contrat auxquels peuvent souscrire des consommateurs externes. Ces consommateurs pourront écouter ces événements pour savoir que quelque chose s'est passé à l'intérieur du smart contrat. Nous déclarerons un événement d'achat au sommet du smart contrat.

tu ajoute donc l'évenement qui déclare l'évenement d'achat. cet événement permet de savoir à chaque fois qu'un jeton est acheté. tu ajoute indexed pour crée un filtrage d'événement

```
contract Transaction {
    mapping(address => uint256) public balances;
    address payable wallet;

    }

    event Purchase(
    address indexed _buyer,
    uint256 _amount
    );

    constructor(address payable _wallet) public {
        wallet = _wallet;
    }

    receive() external payable {
        buyToken();
    }

    function buyToken() public payable{
    balances[msg.sender] += 1;
    wallet.transfer(msg.value);
    emit Purchase(msg.sender, 1);
    }   
}
```
Il ne reste plus cas compilé le code est le tour est jouer ! tu peux passer à la 5 eme partie !

