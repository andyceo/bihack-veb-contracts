pragma solidity ^0.4.17;

contract Reestr {
  address public owner;

  struct Record {
    uint data;
    uint value;
  }

  modifier ownable() {
    if (msg.sender == owner) _;
  }
  
  mapping (uint => Record) Records;

  event _Record(uint guid, uint data, uint value);

function Reestr(){
    owner = msg.sender;
}

  function newRecord(uint _guid, uint _data, uint _value) ownable {
      Records[_guid] = Record(_data , _value );
      _Record(_guid, _data, _value);
  }

  function getRecord(uint guid) returns (uint _data, uint _value) {
    _data  = Records[guid].data;
    _value = Records[guid].value;
  }
}
