class TransactionHistoryModel {
  List<Data>? data;

  TransactionHistoryModel({this.data});

  TransactionHistoryModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? userEmail;
  String? productCode;
  String? productDescription;
  int? productPrice;
  int? adminFee;
  int? totalPrice;
  String? xenditPaymentUrl;
  String? xenditStatus;
  String? xenditPaymentMethod;
  String? xenditPaymentChannel;
  String? status;
  String? created;
  String? updated;

  Data({
    this.id,
    this.userEmail,
    this.productCode,
    this.productDescription,
    this.productPrice,
    this.adminFee,
    this.totalPrice,
    this.xenditPaymentUrl,
    this.xenditStatus,
    this.xenditPaymentMethod,
    this.xenditPaymentChannel,
    this.status,
    this.created,
    this.updated,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userEmail = json['user_email'];
    productCode = json['product_code'];
    productDescription = json['product_description'];
    productPrice = json['product_price'];
    adminFee = json['admin_fee'];
    totalPrice = json['total_price'];
    xenditPaymentUrl = json['xendit_payment_url'];
    xenditStatus = json['xendit_status'];
    xenditPaymentMethod = json['xendit_payment_method'];
    xenditPaymentChannel = json['xendit_payment_channel'];
    status = json['status'];
    created = json['created'];
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_email'] = userEmail;
    data['product_code'] = productCode;
    data['product_description'] = productDescription;
    data['product_price'] = productPrice;
    data['admin_fee'] = adminFee;
    data['total_price'] = totalPrice;
    data['xendit_payment_url'] = xenditPaymentUrl;
    data['xendit_status'] = xenditStatus;
    data['xendit_payment_method'] = xenditPaymentMethod;
    data['xendit_payment_channel'] = xenditPaymentChannel;
    data['status'] = status;
    data['created'] = created;
    data['updated'] = updated;
    return data;
  }
}


