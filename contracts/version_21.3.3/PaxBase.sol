  
  // SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

///
/// @dev Contract for the IATA NDC Passenger Information | version=21.3.3"
///


contract PaxBase{

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

    /// @notice The electronic or geographic address which a party has provided as the contact channel. For example, contact email, contact postal address, contact phone number.
    /// @param contactInfoId - Used to differentiate multiple email addresses of one contact.
    /// @param contactPurposeText - to identify the contact purpose (PADIS code list 3299)
    /// @param contactRefusedInd - When TRUE, Contact Information was refused to be provided.
    /// @param individual - A single human being as distinct from a group, class, or family.
    /// @param phone - A telephone number is a sequence of digits assigned to a fixed-line telephone subscriber station connected to a telephone line or to a wireless electronic telephony device, such as a radio telephone or a mobile telephone, or to other devices for data tra
    /// @param otherAddress - Other Contact Method information. E.g. web site URL, social media handle.
    /// @param emailAddress - The email address which should be used for contact purposes.
    /// @param postalAddress - Natural or physical address used for postal service. May be a building address, airport address, etc.
    /// @param RelationshipToPax - Relationship to the passenger e.g. used for when this individual is an emergency contact
    /// @param individualRefID - Reference to Individual instance(s)
    /// @param paxSegmentRefID - Uniquely identifies a Passenger Segment within the context of one message.
struct ContactInfoType{
  string contactInfoId;
  string contactPurposeText;
  bool contactRefusedInd;
  EmailAddressType[] emailAddress;
  IndividualType individual;
  string individualRefID;
  OtherAddressType[] otherAddress;
  string paxSegmentRefID;
  PhoneType[] phone;
  PostalAddressType[] postalAddress;
  string RelationshipToPax;
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

    /// @notice The email address which should be used for contact purposes.
    /// @param LabelText - Used to differentiate multiple email addresses of one contact.
    /// @param EmailAddressText - The email address which should be used for contact purposes.
struct EmailAddressType{
  string labelText;
  string emailAddressText;
}

/// @notice 
struct OtherAddressType{
  string labelText;
  string otherAddressText;
}


}