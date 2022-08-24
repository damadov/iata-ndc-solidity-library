  
  // SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./ResponseBase.sol";
import "./PaxBase.sol";
import "./TravelAgencyBase.sol";
///
/// @dev Contract for the IATA NDC Passenger Information | version=21.3.3"
///

contract OrderListResponse is ResponseBase{

    /// @notice The OrderList transaction set retrieves a list of Orders that match one or more search criteria.
    /// @param payloadAttributes - IATA payload standard attributes
    /// @param messageDocType - NDC Message document information
    /// @param responseType - OrderList response information.
    /// @param errorType - Error(s) that prevented message processing.
struct OrderListRS{
  IATA_PayloadStandardAttributesType payloadAttributes;
  MessageDocType messageDoc;
  ResponseType response;
  ErrorType[] error;
}

struct ContactInfoListType{
  ContactInfoType contactInfo;
}

/// @notice Placeholder for processing information.
struct OrderListProcessType{
  RemarkType[] remarks;
  MarketingMessageType[] marketingMessage;
  //NoticeType[] notices;
}

    /// @notice Contains information related to potential business errors detected during processing of the preceding request.
  /// @param arrival - Journey Arrival information related to the specified Order.
  /// @param creationDateTime - Date at which the Order was created.
  /// @param dep - Journey departure information related to the specified Order.
  /// @param orderRefID - Reference to an Order's Order ID.
  /// @param orderStatusCode - Status of the Order Status instance. See ATSB Codeset OrderStatus for possible values.
  /// @param paxGroup - A number of individual passengers traveling under one commercial name that associates them. E.g. a Tour group or a group for sales allotment from airline to agency. Group bookings are subject to special booking rules and may be eligible for special fare rules. Usage and nature of groups is left to bilateral agreements.
  /// @param paxList - Passenger data list definition.
  /// @param ticketingStatusCode - Ticketing Status. Examples: Requested, Ticketed, Other
  /// @param travelAgency - A private retailer or public service that provides travel and tourism related services to the public on behalf of suppliers such as activities, airlines, car rentals, cruise lines, hotels, railways, travel insurance, and package tours.
    struct MatchedOrderType{
        string creationDateTime;
        string orderRefID;
        string dateType;
        string orderStatusCode;
        TravelAgencyType travelAgency;
        ArrivalType arrival;
        DepType dep;
        PaxGroupType paxGroup;
        PaxsType paxList;
        string ticketingStatusCode;
        //TicketingStatus ticketingStatus;
    }

  /// @notice Message document information including document name and version number.
  /// @param name - NDC Implementation Name. Example: ThisAirline Gateway
  /// @param refVersionNumber - NDC Framework Version. Example: SOAP 2015.1
    struct ResponseType{
        MatchedOrderType[] matchedOrder;
        OrderListProcessType orderListProcessing;
        WarningType[] warning;
        ContactInfoListType[] contactInfoList;
    }

  /// @notice Journey Arrival information related to the specified Order.
  /// @param IATA_StationCodeType - Arrival station/airport.
  /// @param arrivalDate - Arrival date.
  struct ArrivalType{
    string stationCode;
    string arrivalDate;
}

  /// @notice Journey departure information related to the specified Order.
  /// @param IATA_StationCodeType - Arrival station/airport.
  /// @param depDate - Departure date.
  struct DepType{
    string stationCode;
    string depDate;
}

  /// @notice An exit/entry from an airport building to an aircraft. Could for example be a boarding gate, arrival gate, departing gate etc.
  /// @param boardingGateID - Identifier of the gate. E.g. “A5”.
  struct BoardingGateType{
    string boardingGateID;
}

    /// @notice A departure and/or arrival building for aircraft, passengers or freight at a station for any transport mode.
    /// @param TerminalName - The name of the terminal.
struct TerminalType{
  string terminalName;
}


}