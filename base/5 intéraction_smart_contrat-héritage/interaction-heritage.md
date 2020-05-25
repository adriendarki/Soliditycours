
# Interaction smart contrat  et héritage

 tu vas maintenant  travailler avec de multiples smart contract. Tout d'abord, tu appele des fonctions de smart contract à partir d'un autre smart contract. Ensuite, tu réalise héritage du comportement d'un smart contract parent dans un smart contract enfant.

Tout d'abord, tu remanie le code de l'exemple précédent pour créer un smart contract à jeton qui est distinct du code de MyContrat. Il s'agira d'un pseudo jeton ERC20, qui ne contiendra pas toutes les fonctionnalités d'un vrai smart contract ERC-20. Vous pouvez consulter mon autre tutoriel qui vous montre comment faire.

```
contract ERC20Token {
    string name;
    mapping(address => uint256) public balances;

    function mint() public {
        balances[msg.sender] += 1;
    }
}
```

Cela déplace la fonction mint(), le nom et la correspondance des équilibres vers le contrat symbolique puisque c'est là que ces responsabilités devraient se situer. Nous pouvons maintenant frapper des jetons à partir de MyContract en utilisant le contrat ERC20Token. Pour ce faire, nous avons besoin de plusieurs éléments : l'adresse du jeton et le code du contrat intelligent pour appeler sa fonction mint(). Je vais d'abord stocker l'adresse du token dans une variable d'état comme celle-ci :

contract MyContract {
    adressez-vous à un jeton public ;
    //...
}

Nous pouvons maintenant définir la valeur de l'adresse du jeton dans le constructeur de la manière suivante :

```
constructor(adresse payable _wallet, ERC20Token _token) public {
    wallet = _wallet ;
    token = _token ;
}
```
Maintenant que nous avons l'adresse disponible, nous pouvons accéder au code de contrat intelligent à l'intérieur de la fonction buyToken() comme ceci, et appeler la fonction mint() dessus comme ceci :

```
fonction buyToken() public payable {
    ERC20Token _token = ERC20Token(adresse(token)) ;
    _token.mint() ;
    wallet.transfer(msg.value) ;
}
```

Je voudrais attirer votre attention sur un point avant de poursuivre. Si vous deviez appeler la fonction buyToken() depuis votre compte personnel maintenant, vous n'auriez pas à frapper de jetons pour vous-même. Pourquoi cela ? Revoyons la fonction mint() telle qu'elle est maintenant :
```
fonction mint() public {
    balances [msg.sender] += 1 ;
}
```

La raison pour laquelle il ne frappera pas de jetons pour votre compte est que msg.sender fait en fait référence à l'adresse de MyContract, qui appelle la fonction depuis sa fonction buyToken()function ! Si nous voulons frapper des jetons pour notre propre compte, nous devons utiliser tx.origin pour référencer le compte qui a initié la transaction sur la chaîne de blocage comme ceci :
```
fonction mint() public {
    soldes [tx.origine] += 1 ;
}
```
Et voilà ! Vous pouvez maintenant frapper des jetons d'un autre contrat intelligent ! Regardez la vidéo pour voir comment faire cette démonstration à l'intérieur de Remix. Vous devrez d'abord déployer le contrat intelligent token, obtenir son adresse, puis l'inclure comme argument chaque fois que vous déployez le second contrat intelligent. À ce stade, votre code de contrat intelligent complet devrait ressembler à ceci :

```
contract ERC20Token {
    string name;
    mapping(address => uint256) public balances;

    function mint() public {
        balances[tx.origin] += 1;
    }
}

contract MyContract {
    address public token;

    address payable wallet;

    constructor(address payable _wallet, address _token) public {
        wallet = _wallet;
        token = _token;
    }

    function buyToken() public payable {
        ERC20Token _token = ERC20Token(address(token));
        _token.mint();
        wallet.transfer(msg.value);
    }
}
```
Je vais maintenant vous montrer d'autres façons de faire référence au contrat "Token Smart". Nous pouvons utiliser une expression à un seul mensonge comme celle-ci :

```
function buyToken() public payable {
    ERC20Token(address(token)).mint();
    wallet.transfer(msg.value);
}
```


Nous pouvons également remanier le code pour stocker le jeton dans une variable d'état comme celle-ci :

```
```

Ensuite, on peut simplement appeler la fonction de la menthe comme ceci :


Parlons maintenant d'héritage. La solidité vous permet de créer des contrats intelligents qui héritent les uns des autres. Créons un nouveau pseudo jeton appelé MyToken qui hérite de notre contrat intelligent original. Nous utiliserons l'héritage pour lui donner un nom, un symbole et une fonction unique. Nous pouvons hériter du contrat intelligent de cette manière :

contract MyToken is ERC20Token {
    // ...

}


Nous pouvons maintenant garder la trace du nom du jeton dans le contrat parental intelligent comme ceci :

```
contract ERC20Token {
    string public name;
    mapping(address => uint256) public balances;

    constructor(string memory _name) public {
        name = _name;
    }

    function mint() public {
        balances[tx.origin] ++;
    }
}
```


Nous pouvons passer outre le nom du jeton parent dans le constructeur de notre jeton enfant. Pendant que nous sommes ici, nous allons également créer un symbole pour le jeton enfant et le placer dans le constructeur. Je vais vous montrer comment passer outre le constructeur du contrat du jeton parent, tout en attribuant les nouvelles valeurs comme ceci :

```
contract MyToken is ERC20Token {
    string public symbol;

    constructor(
        string memory _name,
        string memory _symbol
    )
        ERC20Token(_name)
    public {
        symbol = _symbol;
    }
}
```

Génial ! Nous avons maintenant personnalisé MyToken. Mettons maintenant à jour la fonction mint() pour remplacer la fonctionnalité du token parent. Tout d'abord, créons un moyen de stocker l'adresse de tous les propriétaires de token. Nous allons également définir le nombre de propriétaires comme ceci :

```
contract MyToken is ERC20Token {
    address[] public owners;
    uint256 public ownerCount;
    //...
}

```
Maintenant, mettons à jour ces valeurs dans notre propre fonction mint() tout en préservant le comportement du contrat intelligent du jeton parent. Nous pouvons faire cela avec le super mot-clé comme ceci 


```
function mint() public {
    super.mint();
    ownerCount ++;
    owners.push(msg.sender);
}

```

Génial ! Nous avons maintenant créé notre propre jeton personnalisé qui hérite du jeton parent. Votre code de contrat intelligent complet devrait ressembler à ceci :


```

contract ERC20Token {
    string public name;
    mapping(address => uint256) public balances;

    constructor(string memory _name) public {
        name = _name;
    }

    function mint() public virtual {
        balances[tx.origin] ++;
    }
}

contract MyToken is ERC20Token {
    string public symbol;
    address[] public owners;
    uint256 public ownerCount;

    constructor(
        string memory _name,
        string memory _symbol
    )
        ERC20Token(_name)
    public {
        symbol = _symbol;
    }

    function mint() public override {
        super.mint();
        ownerCount ++;
        owners.push(msg.sender);
    }

}
```