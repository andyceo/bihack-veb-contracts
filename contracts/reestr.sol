pragma solidity ^0.4.17;

contract Reestr {
  address public owner;


    struct Request {
        uint id;
        string title;
        uint value;
        uint status;
        address owner;
    }

    struct Object {
        uint lastid;
        uint status;
        string title;
        uint value;
        address owner;
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

function addOwner(address _newOwner)  {
    Owners[_newOwner] = 0;
}

function newObeject(uint _guid, uint _status, string _title, uint _value, address _owner )  {
      Objects[_guid] = Object( 0 , _status, _title,  _value, _owner);
      _Object(_guid, 0);
}

function newRequestr(uint _guid, string _title, uint _value , uint _status, address _owner)  {
    Objects[_guid].lastid =+ 1 ;
    Objects[_guid].Records[Objects[_guid].lastid] = Request( Objects[_guid].lastid, _title, _value, _status, _owner );
    Objects[_guid].title = _title;
    Objects[_guid].value = _value;
    Objects[_guid].owner = _owner;
    
}

function getlastid(uint _guid) returns (uint lastid) {
    lastid  = Objects[_guid].lastid;
}

function changeStatus(uint _guid, uint _id, uint _status)  {
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
