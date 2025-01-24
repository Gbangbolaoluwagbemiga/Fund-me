pragma solidity ^0.8.7;

contract MappingArr {

mapping (uint256=>address) mapped;

address[] mappedArr;

function set(uint256 _key, address _owner) public{
    mapped[_key]=_owner;
    mappedArr.push(_owner);
}

function retreive(uint256 _key) view public returns (address){
return mapped[_key];
}

function retreiveAll() view public returns (address[] memory) {
return mappedArr;
}

function deleteItem(uint256 _key) public{
delete mapped[_key];
}
}

contract Enum{
    enum Status{
        notStarted,
        running, 
        completed
    }

    Status public status;

    function get() public view returns (Status) {
        return status;
    }

     function set(Status _status) public {
        status = _status;
    }

    function state() public {
        status = Status.completed;
    }

function checkmate() public view returns (string memory){
    require(status==Status.completed, "not completed");
     string memory name=  "congratulations";
     return name;
}

    function reset() public {
        delete status;
    }

}

contract Struct{
  struct Userdetails{
        uint256 id;
        string name;
         bool married;
    
        // address [] friends;
    }
    Userdetails public userdetails;

    function get() public view returns(Userdetails memory) {
    return userdetails;
    }

    function set(uint256 _id,string memory _name, bool _married) public{
        userdetails.id=_id;
        userdetails.name=_name;
        userdetails.married=_married;

    }
}

library Math {
    function sqrt(uint256 y) internal pure returns (uint256 z) {
        if (y > 3) {
            z = y;
            uint256 x = y / 2 + 1;
            while (x < z) {
                z = x;
                x = (y / x + x) / 2;
            }
        } else if (y != 0) {
            z = 1;
        }
        // else z = 0 (default value)
    }
}

contract TestMath {
    using Math for uint;
    function testSquareRoot(uint256 x) public pure returns (uint256) {
        return x.sqrt();
    }
}


