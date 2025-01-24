// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;


// Create contract from a contract

contract Car {
    address public owner;
    string public model;
    address public carAddr;

    constructor(address _owner, string memory _model) payable {
        owner = _owner;
        model = _model;
        carAddr = address(this);
    }

    function withdraw() public {
        
    }
}

contract CarFactory {
    Car[] public cars;

    function create(address _owner, string memory _model) public {
        Car car = new Car(_owner, _model);
        cars.push(car);
    }

    function createAndSendEther(address _owner, string memory _model)
        public
        payable
    {
        Car car = (new Car){value: msg.value}(_owner, _model);
        cars.push(car);
    }

    function create2(address _owner, string memory _model, bytes32 _salt)
        public
    {
        Car car = (new Car){salt: _salt}(_owner, _model);
        cars.push(car);
    }

    function create2AndSendEther(
        address _owner,
        string memory _model,
        bytes32 _salt
    ) public payable {
        Car car = (new Car){value: msg.value, salt: _salt}(_owner, _model);
        cars.push(car);
    }

    function getCar(uint256 _index)
        public
        view
        returns (
            address owner,
            string memory model,
            address carAddr,
            uint256 balance
        )
    {
        Car car = cars[_index];

        return (car.owner(), car.model(), car.carAddr(), address(car).balance);
    }
}



// DeleteCall
// contract B{
//     uint256 public num;
//     address hey;

//     function foo(uint256 _num, address _hey) public payable{
//         num+=_num;
//         hey=_hey;
//     }
// }

// contract A{
//      uint256 public num;
//     address hey;

//     event delegateRes(address ca, uint amount, bool res);

//     function modify(address payable  _CA, uint256 _num) public payable  {
//     (bool success,) = _CA.delegatecall(abi.encodeWithSignature("foo(uint256,address)", _num,_CA));

//     emit delegateRes(_CA, _num, success);
//     }

// }



// contract MappingArr {

// mapping (uint256=>address) mapped;

// address[] mappedArr;

// function set(uint256 _key, address _owner) public{
//     mapped[_key]=_owner;
//     mappedArr.push(_owner);
// }

// function retreive(uint256 _key) view public returns (address){
// return mapped[_key];
// }

// function retreiveAll() view public returns (address[] memory) {
// return mappedArr;
// }

// function deleteItem(uint256 _key) public{
// delete mapped[_key];
// }
// }

// contract Enum{
//     enum Status{
//         notStarted,
//         running, 
//         completed
//     }

//     Status public status;

//     function get() public view returns (Status) {
//         return status;
//     }

//      function set(Status _status) public {
//         status = _status;
//     }

//     function state() public {
//         status = Status.completed;
//     }

// function checkmate() public view returns (string memory){
//     require(status==Status.completed, "not completed");
//      string memory name=  "congratulations";
//      return name;
// }

//     function reset() public {
//         delete status;
//     }

// }

// contract Struct{
//   struct Userdetails{
//         uint256 id;
//         string name;
//          bool married;
    
//         // address [] friends;
//     }
//     Userdetails public userdetails;

//     function get() public view returns(Userdetails memory) {
//     return userdetails;
//     }

//     function set(uint256 _id,string memory _name, bool _married) public{
//         userdetails.id=_id;
//         userdetails.name=_name;
//         userdetails.married=_married;

//     }
// }

// library Math {
//     function sqrt(uint256 y) internal pure returns (uint256 z) {
//         if (y > 3) {
//             z = y;
//             uint256 x = y / 2 + 1;
//             while (x < z) {
//                 z = x;
//                 x = (y / x + x) / 2;
//             }
//         } else if (y != 0) {
//             z = 1;
//         }
//         // else z = 0 (default value)
//     }
// }

// contract TestMath {
//     using Math for uint;
//     function testSquareRoot(uint256 x) public pure returns (uint256) {
//         return x.sqrt();
//     }
// }


