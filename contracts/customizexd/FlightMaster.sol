  
  // SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

///
/// @dev Contract for the IATA NDC FlightSegment
///

abstract contract FlightMaster {


struct FlightSegment{
    uint256 flightNo;
    uint256 flightDate;
    Location departure;
    Location arrival;
    uint256 departureTime;
    uint256 arrivalTime;
    Carrier OperatingCarrier;
    Carrier MarketingCarrier;
  }

  struct Location{
    string airportCode;
    uint256 timestamp;
    string date;
    string time;
  }

  struct Carrier{
    string airlineId;
    string flightNumber;
  }

  struct FlightDetail{
    string duration;

  }




}