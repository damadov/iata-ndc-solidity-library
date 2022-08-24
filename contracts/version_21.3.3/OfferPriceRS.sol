  
  // SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./ResponseBase.sol";
import "./PaxBase.sol";
import "./TravelAgencyBase.sol";
///
/// @dev Contract for the IATA NDC Passenger Information | version=21.3.3"
///

contract OfferPriceResponse is ResponseBase{

    /// @notice The OfferPrice transaction set may return two different sets of content. The response will initially provide the priced Offer reflecting the Offers/OfferItems requested for pricing, and potentially additional Offers that are applicable and relevant to the PricedOffer provided.
    /// @param payloadAttributes - IATA payload standard attributes
    /// @param messageDocType - NDC Message document information
    /// @param responseType - OrderList response information.
    /// @param errorType - Error(s) that prevented message processing.
struct OfferPriceRS{
  IATA_PayloadStandardAttributesType payloadAttributes;
  MessageDocType messageDoc;
  ResponseType response;
  ErrorType error;
}

  /// @notice Offer Price RS response information.
  /// @param DataListsType - Data List definition for this message.
  /// @param MetadataType - Message wide metadata information.
  /// @param OtherOffersType - Grouping of Offers returned by a single ORA.
  /// @param PaymentFunctionsOfferType - Is the container of all payment relevant functions.
  /// @param PolicyType - Message policy information, including PCI, PII information.
  /// @param NewOfferType - A proposal to sell a specific set of products or Services under specific conditions, for a certain price...This supports a shopping basket concept for non-flight services.
  /// @param OrderListProcessType - A set of Information related to how response results should be returned.
  /// @param PromotionType - Data List definition for this message.
  /// @param WarningType - Contains information related to potential business errors detected during processing of the preceding request.
    struct ResponseType{
        //DataListsType dataLists;
        MetadataType metaData;
        OtherOffersType otherOffers;
        PaymentFunctionsOfferType[] paymentFunctions;
        PolicyType[] policy;
        NewOfferType pricedOffer;
        //ResponseParametersResponseType processing;
        //PromotionType[] promotion;
        WarningType[] warning;
    }

    struct MetadataType{
        CodesetMetadataType codesetMetadata;
        FieldMetadataType fieldMetadata;
    }

    struct CodesetMetadataType{
        string codesetName;
        uint16 codesetVersionNumber;
        LangUsageType langUsage;
        string ownerID;
        string ownerName;
    }

    struct FieldMetadataType{
        bool mandatoryInd;
        string pathText;
    }

    struct OtherOffersType{
        ALaCarteOfferType aLaCarteOffer;
        NewOfferType offer;
    }

    struct PaymentFunctionsOfferType{
        OfferAssociationType offerAssociation;
        PaymentSupportedMethodType paymentSupportedMethod;
    }

    struct PolicyType{
        DescType desc;
        string ownerName;
        PolicyNodeInfoType[] policyNodeInfo;
        string policyTypeText;
        uint16 versionNumber;
    }

    struct NewOfferType{
        string offerID;
        /*Other parameters should be defined...*/
    }


}