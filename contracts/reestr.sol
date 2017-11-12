pragma solidity ^0.4.17;

contract Reestr {
  address public owner;


    struct Request {
        uint id;
        string data;
        string value;
    }

    struct Object {
        uint lastid;
        mapping (uint => Request) Records;
    }

    modifier ownable() {
        if (msg.sender == owner) _;
    }
    mapping (uint => Object) Objects;
event _Request(uint guid, string data, string value);
event _Object(uint guid, uint lastid);

function Reestr(){
    owner = msg.sender;
}

function newObeject(uint _guid) ownable {
      Objects[_guid] = Object( 0 );
      _Object(_guid, 0);
}

function newRequestr(uint _guid, string _data, string _value ) ownable {
    Objects[_guid].lastid =+ 1 ;
    Objects[_guid].Records[Objects[_guid].lastid] = Request( Objects[_guid].lastid, _data, _value );
}

function getlastid(uint _guid) returns (uint lastid) {
    lastid  = Objects[_guid].lastid;
}

}
