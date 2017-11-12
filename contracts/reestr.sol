pragma solidity ^0.4.17;

contract Reestr {
  address public owner;

  struct Record {
    string data;
    string value;
  }

  modifier ownable() {
    if (msg.sender == owner) _;
  }
  
  mapping (uint => Record) Records;

  event _Record(uint guid, string data, string value);

function Reestr(){
    owner = msg.sender;
}

  function newRecord(uint _guid, string _data, string _value) ownable {
      Records[_guid] = Record(_data , _value );
      _Record(_guid, _data, _value);
  }

  function getRecord(uint guid) returns (string _data, string _value) {
    _data  = Records[guid].data;
    _value = Records[guid].value;
  }
}
