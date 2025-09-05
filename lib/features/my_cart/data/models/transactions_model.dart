class TransactionModel {
  AmountModel? amount;
  String? description;
  PaymentOptionsModel? paymentOptions;
  ItemListModel? itemList;

  TransactionModel({this.amount, this.description, this.paymentOptions, this.itemList});

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      amount: json['amount'] != null ? AmountModel.fromJson(json['amount']) : null,
      description: json['description'],
      paymentOptions: json['payment_options'] != null
          ? PaymentOptionsModel.fromJson(json['payment_options'])
          : null,
      itemList: json['item_list'] != null ? ItemListModel.fromJson(json['item_list']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (amount != null) data['amount'] = amount!.toJson();
    data['description'] = description;
    if (paymentOptions != null) data['payment_options'] = paymentOptions!.toJson();
    if (itemList != null) data['item_list'] = itemList!.toJson();
    return data;
  }
}

class AmountModel {
  String? total;
  String? currency;
  DetailsModel? details;

  AmountModel({this.total, this.currency, this.details});

  factory AmountModel.fromJson(Map<String, dynamic> json) {
    return AmountModel(
      total: json['total'],
      currency: json['currency'],
      details: json['details'] != null ? DetailsModel.fromJson(json['details']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['total'] = total;
    data['currency'] = currency;
    if (details != null) data['details'] = details!.toJson();
    return data;
  }
}

class DetailsModel {
  String? subtotal;
  String? shipping;
  int? shippingDiscount;

  DetailsModel({this.subtotal, this.shipping, this.shippingDiscount});

  factory DetailsModel.fromJson(Map<String, dynamic> json) {
    return DetailsModel(
      subtotal: json['subtotal'],
      shipping: json['shipping'],
      shippingDiscount: json['shipping_discount'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['subtotal'] = subtotal;
    data['shipping'] = shipping;
    data['shipping_discount'] = shippingDiscount;
    return data;
  }
}

class PaymentOptionsModel {
  String? allowedPaymentMethod;

  PaymentOptionsModel({this.allowedPaymentMethod});

  factory PaymentOptionsModel.fromJson(Map<String, dynamic> json) {
    return PaymentOptionsModel(
      allowedPaymentMethod: json['allowed_payment_method'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['allowed_payment_method'] = allowedPaymentMethod;
    return data;
  }
}

class ItemListModel {
  List<ItemModel>? items;
  ShippingAddress? shippingAddress;

  ItemListModel({this.items, this.shippingAddress});

  factory ItemListModel.fromJson(Map<String, dynamic> json) {
    return ItemListModel(
      items: json['items'] != null
          ? List<ItemModel>.from(json['items'].map((x) => ItemModel.fromJson(x)))
          : [],
      shippingAddress: json['shipping_address'] != null
          ? ShippingAddress.fromJson(json['shipping_address'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (items != null) {
      data['items'] = items!.map((x) => x.toJson()).toList();
    }
    if (shippingAddress != null) {
      data['shipping_address'] = shippingAddress!.toJson();
    }
    return data;
  }
}

class ItemModel {
  String? name;
  int? quantity;
  String? price;
  String? currency;

  ItemModel({this.name, this.quantity, this.price, this.currency});

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      name: json['name'],
      quantity: json['quantity'],
      price: json['price'],
      currency: json['currency'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['quantity'] = quantity;
    data['price'] = price;
    data['currency'] = currency;
    return data;
  }
}

class ShippingAddress {
  String? recipientName;
  String? line1;
  String? line2;
  String? city;
  String? countryCode;
  String? postalCode;
  String? phone;
  String? state;

  ShippingAddress({
    this.recipientName,
    this.line1,
    this.line2,
    this.city,
    this.countryCode,
    this.postalCode,
    this.phone,
    this.state,
  });

  factory ShippingAddress.fromJson(Map<String, dynamic> json) {
    return ShippingAddress(
      recipientName: json['recipient_name'],
      line1: json['line1'],
      line2: json['line2'],
      city: json['city'],
      countryCode: json['country_code'],
      postalCode: json['postal_code'],
      phone: json['phone'],
      state: json['state'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['recipient_name'] = recipientName;
    data['line1'] = line1;
    data['line2'] = line2;
    data['city'] = city;
    data['country_code'] = countryCode;
    data['postal_code'] = postalCode;
    data['phone'] = phone;
    data['state'] = state;
    return data;
  }
}
