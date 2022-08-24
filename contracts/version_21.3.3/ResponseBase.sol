  
  // SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./PaxBase.sol";
import "./TravelAgencyBase.sol";
///
/// @dev Contract for Response Basic Structs"
///

contract ResponseBase {

    /// @notice Contains information related to potential business errors detected during processing of the preceding request.
    /// @param code - The code corresponding to the processing warning as defined by PADIS 9321.
    /// @param descText - Free text description of the provided warning.
    /// @param languageCode - Language code associated with the warning response.
    /// @param ownerName - The name of the organization owning the warning codelist.
    /// @param statusText - Document processing status.  Recommended values are NotProcessed, Incomplete, Complete, Unknown.
    /// @param tagText - Identifies the tag/XPath which relates to the provided Warning.
    /// @param typeCode - Uses a bilaterally agreed set of values to indicate the warning type.  The validating XSD can expect to accept values that it has not been explicitly coded for and process them by using Type = 'unknown'.
    /// @param URL - Link to an online description of the provided warning.
    struct ErrorType{
        string code;
        string descText;
        string errorID;
        string langCode;
        string ownerName;
        string statusText;
        string tagText;
        string typeCode;
        string URL;
    }

    /// @notice Contains information related to potential business errors detected during processing of the preceding request.
    /// @param code - The code corresponding to the processing warning as defined by PADIS 9321.
    /// @param descText - Free text description of the provided warning.
    /// @param languageCode - Language code associated with the warning response.
    /// @param ownerName - The name of the organization owning the warning codelist.
    /// @param statusText - Document processing status.  Recommended values are NotProcessed, Incomplete, Complete, Unknown.
    /// @param tagText - Identifies the tag/XPath which relates to the provided Warning.
    /// @param typeCode - Uses a bilaterally agreed set of values to indicate the warning type.  The validating XSD can expect to accept values that it has not been explicitly coded for and process them by using Type = 'unknown'.
    /// @param URL - Link to an online description of the provided warning.
    struct WarningType{
        string code;
        string descText;
        string warningID;
        string langCode;
        string ownerName;
        string statusText;
        string tagText;
        string typeCode;
        string URL;
    }

    /// @notice (name changed by M.Thomas, 5-Jul-2016) The IATA_PayloadStdAttributes defines the standard attributes that appear on the root element for all IATA payloads.
    /// @param echoTokenText - A reference for additional message identification, assigned by the requesting host system. When a request message includes an echo token the corresponding response message MUST include an echo token with an identical value.
    /// @param timestamp - Indicates the creation date and time of the message in UTC.
    /// @param version - For all IATA versioned messages, the version of the message is indicated by a decimal value.
    /// @param trxID - A unique identifier to relate all messages within a transaction (e.g. this would be sent in all request and response messages that are part of an on-going transaction).
    /// @param seqNumber - Used to identify the sequence number of the transaction as assigned by the sending system; allows for an application to process messages in a certain order or to request a resynchronization of messages in the event that a system has been off-line and nee
    /// @param primaryLangID - Identifes the primary language preference for the message.  The human language is identified by ISO 639 codes.
    /// @param altLangID - Identifies the alternate language for a customer or message. The human language is identified by ISO 639 codes.
    /// @param retransmissionIndicator - When true, indicates the message is being re-sent after a failure. It is recommended that this attribute is used (i.e., set to true) only when a message is retransmitted.
    /// @param correlationID - Allow end-to-end correlation of log messages with the corresponding Web service message throughout the processing of the Web service message.
    struct IATA_PayloadStandardAttributesType{
        string echoTokenText;
        string timestamp;
        string versionNumber;
        string trxID;
        uint16 seqNumber;
        //TransactionStatusCode transactionStatusCode; /* Planned to define */
        string primaryLangID;
        string altLangID;
        bool retransmissionIndicator;
        string correlationID; //Create StringLength1to64 type and change with it.
    }

  /// @notice Message document information including document name and version number.
  /// @param name - NDC Implementation Name. Example: ThisAirline Gateway
  /// @param refVersionNumber - NDC Framework Version. Example: SOAP 2015.1
    struct MessageDocType{
    string name;
    string refVersionNumber;
    }

  /// @notice Language Code representation.
    struct LangUsageType{
        string langCode;
        string LangUsageText;
    }

    /// @notice Additional, supplementary information about the document or service.
struct RemarkType{
  bool displayInd;
  string remarkText;
  string timestamp;
}

/// @notice Additional, supplementary information about the document or service.
struct MarketingMessageType{
  GeneralAssociationType generalAssociation;
}

    struct ResponseParametersResponseType{
        //BDC_Type BDC;
        //CurParameterType curParameter;
        //DeviceType device;
        //LangUsageType langUsage;
        MarketingMessageType marketingMessage;
        string measurementSystemCode;
        //PaxGroupType paxGroup;
        //PricingParameterType pricingParameter;
        string reasonCode;
        RemarkType[] remarks;
    }

    struct GeneralAssociationType{
  string associatedObjectID;
  string associatedObjectName;
  string associatedObjectPath;
}

}