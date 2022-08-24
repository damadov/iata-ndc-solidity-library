  
  // SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

///
/// @dev Contract for the IATA NDC Order Information
///

abstract contract OrderMaster {

struct Order{
    string orderId;
    string owner;
    string ownerType;
    BookingReference[] bookingReferences;
    TotalAmount totalOrderPrice;
    OrderItem[] orderItems;
}

struct OrderItem{
    PriceDetail priceDetail;
    Service service;
}

struct PriceDetail{
    TotalAmount totalAmount;
    Amount baseAmount;
    Surcharge[] surcharges;
    Amount fees;
}

struct Amount {
    string code;
    uint256 value;
}

struct TotalAmount{
    Amount simpleCurrencyPrice;
}

struct Surcharge{
    Amount total;
}

struct Service{
    string serviceId;
    string passengerRef;
    string segmentRef;
}

struct BookingReference{
        string id;
    }

}