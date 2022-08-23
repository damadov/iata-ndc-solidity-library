  
  // SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

///
/// @dev Contract for the IATA NDC Ticket Document Information
///

abstract contract TicketMaster {

struct TicketDocInfo{
    TicketDocument ticketDocument;
    string passengerReference;

}

struct TicketDocument{
    string ticketDocNbr;
    string _type;
    uint8 numberOfBooklets;
    string remark;
    string reportingType;
}

}