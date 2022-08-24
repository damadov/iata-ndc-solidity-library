  
  // SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

///
/// @dev Contract for the IATA NDC Passenger Information | version=21.3.3"
///


contract TravelAgencyBase{

        /// @notice A private retailer or public service that provides travel and tourism related services to the public on behalf of suppliers such as activities, airlines, car rentals, cruise lines, hotels, railways, travel insurance, and package tours.
    /// @param AgencyID - Unique Agency Seller ID. Example: CTRV
    /// @param IATA_Number - IATA-assigned agency number.  Example: 98417900
    /// @param Name - Agency name.  Example: Carson Travel
    /// @param PseudoCityID - An identifier for a corporate user of a computer reservation system (CRS) or global distribution system (GDS), typically a travel agency. Also known as Office ID.
    /// @param TypeCode - Agency type code.  Examples TravelAgency, OnlineTravelAgency, or TravelManagementCompany.
    /// @param TravelAgent - Agent who solicits and procures business from potential customers on behalf of one or more principals, usually against payment of a percentage of the realized sales revenue as commission.
struct TravelAgencyType{
  string agencyId;
  uint256 IATA_number;
  string name;
  string  PseudoCityID;
  string typeCode; 
  TravelAgentType travelAgent;
}

  /// @notice Agent who solicits and procures business from potential customers on behalf of one or more principals, usually against payment of a percentage of the realized sales revenue as commission.
    /// @param TravelAgentID - Booking and Servicing Agent information. ID. Example: 98417900 Note: The ID correlates to the specified ID Type.
    /// @param TypeCode - Agency/ Agent Identification Type. Example: 706 (IATA agency numeric code) Encoding Scheme: IATA Padis Codeset - List for data element 9893 (Identification Type, coded)
struct TravelAgentType{
  string travelAgentID;
  string typeCode;
}

}