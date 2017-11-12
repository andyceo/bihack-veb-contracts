pragma solidity ^0.4.17;

contract Reestr {
  address public owner;


    struct Request {
        uint id;
        string data;
        string value;
        uint status;
    }

    struct Object {
        uint lastid;
        uint status;
        mapping (uint => Request) Records;
    }
    
    mapping (uint => Object) Objects;
    
    mapping (address => uint) Owners;

    modifier ownable() {
        if (Owners[msg.sender] == 0) _;
    }    
event _Request(uint guid, string data, string value);
event _Object(uint guid, uint lastid);

function Reestr(){
    Owners[msg.sender] = 0;
}

function addOwner(address _newOwner) ownable {
    Owners[_newOwner] = 0;
}

function newObeject(uint _guid) ownable {
      Objects[_guid] = Object( 0 , 0 );
      _Object(_guid, 0);
}

function newRequestr(uint _guid, string _data, string _value , uint _status) ownable {
    Objects[_guid].lastid =+ 1 ;
    Objects[_guid].Records[Objects[_guid].lastid] = Request( Objects[_guid].lastid, _data, _value, _status );
}

function getlastid(uint _guid) returns (uint lastid) {
    lastid  = Objects[_guid].lastid;
}

function changeStatus(uint _guid, uint _id, uint _status) ownable {
    Objects[_guid].Records[_id].status = _status; 
    for (var i = 0; i < Objects[_guid].lastid; i++)
    {
        if (Objects[_guid].Records[i].status == 1) {
            Objects[_guid].status = 1;  
            
        }
    }
}

function getRequest(uint _guid, uint _id) returns (string _data, string _value, uint _status) {
    _data = Objects[_guid].Records[_id].data;
    _value = Objects[_guid].Records[_id].value;
    _status = Objects[_guid].Records[_id].status;
}

}
