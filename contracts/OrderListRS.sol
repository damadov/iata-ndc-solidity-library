  
  // SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

///
/// @dev Contract for the IATA NDC Passenger Information
///

abstract contract OrderListRS {



struct Passenger{
    string passengerId;
    string PTC;
    string residenceCountryCode;
    IndividualType individual;
}

    /// @notice A single human being as distinct from a group, class, or family.
    /// @param IndividualID - Uniquely Identifies an Individual within the context of one message.
    /// @param GivenName - A personal name given to the individual at birth and used before a family name. Also called first name. E.g. JOHN.
    /// @param MiddleName - Individual's middle name or initial.  E.g. G, GEORGE.
   /// @param Surname - Individual's hereditary name(s) common to all members of a family. Also known as family name or last name. E.g. SMITH. Excludes any potential suffix.
struct IndividualType{
    string individualId;
    string givenName;
    string middleName;
    string surname;
}

    /// @notice The email address which should be used for contact purposes.
    /// @param LabelText - Used to differentiate multiple email addresses of one contact.
    /// @param EmailAddressText - The email address which should be used for contact purposes.
struct EmailAddressType{
  string labelText;
  string emailAddressText;
}

    /// @notice A telephone number is a sequence of digits assigned to a fixed-line telephone subscriber station connected to a telephone line or to a wireless electronic telephony device, such as a radio telephone or a mobile telephone, or to other devices for data tra
    /// @param LabelText - Used to differentiate multiple Phone numbers of one contact.  Examples: Work, Home, Mobile
    /// @param CountryDialingCode - Numeric telephone dialing prefixes for the member countries of the International Telecommunication Union (ITU).
    /// @param AreaCodeNumber - Phone number area code.  Example: 813
    /// @param PhoneNumber - Phone number text. Examples: +1 999-999-9999 ext 1234,  617-9976 Note: This may be a simple, un-structured phone number, such as +01 999-999-9999 ext 1234 or combined with the additional attributes to create a structured phone number.
    /// @param ExtensionNumber - Phone extension number.  Example: 1234
struct PhoneType{
  string labelText;
  string emailAddressText;
}

    /// @notice Natural or physical address used for postal service. May be a building address, airport address, etc.
    /// @param LabelText - Used to differentiate multiple Postal Addresses of one contact.  Examples: AddressAtOrigin or AddressAtDestination
    /// @param StreetText - Street name and number. Examples: Main Street, 100 Main Street
    /// @param BuildingRoomText - Additional address information including building name, room, apartment, or suite number.
    /// @param PO_BoxCode - Post office box.  Example: P.O. Box 21
    /// @param PostalCode - Postal code. Examples: 11001, 11001-2345
    /// @param CityName - The name, expressed as text, of the city, town or village.
    /// @param CountrySubdivisionName - The name, expressed as text, of the subdivision of a country.
    /// @param CountryName - The name, expressed as text, of the country.
    /// @param CountryCode - ISO Country Code. Examples: US, FR.
struct PostalAddressType{
  string labelText;
  string streetText;
  string buildingRoomText;
  string PO_boxcode;
  string postalCode;
  string cityName;
  string countrySubdivisionName;
  string countryName;
  string countryCode;
}

    /// @notice The electronic or geographic address which a party has provided as the contact channel. For example, contact email, contact postal address, contact phone number.
    /// @param ContactInfoID - Used to differentiate multiple email addresses of one contact.
    /// @param ContactTypeText - Classification for a particular set of contact information (e.g. Primary, Payment, etc.)
    /// @param IndividualRef - Reference to Individual instance(s)
    /// @param ContactRefusedInd - When TRUE, Passenger refused to provide Contact Information.
    /// @param Phone - A telephone number is a sequence of digits assigned to a fixed-line telephone subscriber station connected to a telephone line or to a wireless electronic telephony device, such as a radio telephone or a mobile telephone, or to other devices for data tra
    /// @param OtherAddress - Other Contact Method information. E.g. web site URL, social media handle.
    /// @param EmailAddress - The email address which should be used for contact purposes.
    /// @param Individual - A single human being as distinct from a group, class, or family.
    /// @param PostalAddress - Natural or physical address used for postal service. May be a building address, airport address, etc.
struct ContactInfoType{
  string contactInfoId;
  string contactTypeText;
  string individualRef;
  string contactRefuesdInfo;
  PhoneType phoneType;
  EmailAddressType emailAddress;
  IndividualType individual;
  PostalAddressType postalAddress;
}

 /// @notice Any person except members of the crew carried or to be carried with the consent of the carrier, on board of any transport vehicle such as aircraft, train, bus, ship. Holds the attributes specific to a one booking, from shopping to f
    /// @param PaxID - Uniquely identifies a Passenger within the context of one message.
    /// @param Individual - A single human being as distinct from a group, class, or family.
struct PaxType{
  string paxId;
  IndividualType individual;
}

 /// @notice Passenger and Group information.
    /// @param Pax -Any person except members of the crew carried or to be carried with the consent of the carrier, on board of any transport vehicle such as aircraft, train, bus, ship. Holds the attributes specific to a one booking, from shopping to f
    /// @param PaxGroup - A number of individual passengers traveling under one commercial name that associates them. Passengers of a group have a homogenous itinerary, i.e. use the same segments. Group bookings are subject to special booking rules and may be eligible for special
struct PaxsType{
  PaxType pax;
  PaxGroupType paxGroup;
}

 /// @notice A number of individual passengers traveling under one commercial name that associates them. Passengers of a group have a homogenous itinerary, i.e. use the same segments. Group bookings are subject to special booking rules and may be eligible for special
    /// @param GroupID - Uniquely identifies a Passenger Group.
    /// @param Name - Group name.  Example: ABC Tour Club
    /// @param IntendedPaxQty - Intended number of passengers for this Group.
    /// @param ContactInfo - Primary group contact information.
struct PaxGroupType{
  string groupId;
  string name;
  uint8 intendedPaxQty;
  ContactInfoType contactInfo;
}

    /// @notice A departure and/or arrival building for aircraft, passengers or freight at a station for any transport mode.
    /// @param TerminalName - The name of the terminal.
struct TerminalType{
  string terminalName;
}

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