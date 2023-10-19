class TransactionModel {
  String? id;
  String? userId;
  String? productId;
  String? customerId;
  int? productPrice;
  int? adminFee;
  int? totalPrice;
  String? xenditInvoiceId;
  String? xenditPaymentUrl;
  String? xenditStatus;
  String? xenditExternalId;
  String? xenditPaymentMethod;
  String? xenditPaymentChannel;
  String? status;
  String? created;
  String? updated;
  String? deleted;

  TransactionModel({
    this.id,
    this.userId,
    this.productId,
    this.customerId,
    this.productPrice,
    this.adminFee,
    this.totalPrice,
    this.xenditInvoiceId,
    this.xenditPaymentUrl,
    this.xenditStatus,
    this.xenditExternalId,
    this.xenditPaymentMethod,
    this.xenditPaymentChannel,
    this.status,
    this.created,
    this.updated,
    this.deleted,
  });

  TransactionModel.fromJson(Map<String, dynamic> json) {
    id = json['data']['id'];
    userId = json['data']['user_id'];
    productId = json['data']['product_id'];
    customerId = json['data']['customer_id'];
    productPrice = json['data']['product_price'];
    adminFee = json['data']['admin_fee'];
    totalPrice = json['data']['total_price'];
    xenditInvoiceId = json['data']['xendit_invoice_id'];
    xenditPaymentUrl = json['data']['xendit_payment_url'];
    xenditStatus = json['data']['xendit_status'];
    xenditExternalId = json['data']['xendit_external_id'];
    xenditPaymentMethod = json['data']['xendit_payment_method'];
    xenditPaymentChannel = json['data']['xendit_payment_channel'];
    status = json['data']['status'];
    created = json['data']['created'];
    updated = json['data']['updated'];
    deleted = json['data']['deleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data']['id'] = id;
    data['data']['user_id'] = userId;
    data['data']['product_id'] = productId;
    data['data']['customer_id'] = customerId;
    data['data']['product_price'] = productPrice;
    data['data']['admin_fee'] = adminFee;
    data['data']['total_price'] = totalPrice;
    data['data']['xendit_invoice_id'] = xenditInvoiceId;
    data['data']['xendit_payment_url'] = xenditPaymentUrl;
    data['data']['xendit_status'] = xenditStatus;
    data['data']['xendit_external_id'] = xenditExternalId;
    data['data']['xendit_payment_method'] = xenditPaymentMethod;
    data['data']['xendit_payment_channel'] = xenditPaymentChannel;
    data['data']['status'] = status;
    data['data']['created'] = created;
    data['data']['updated'] = updated;
    data['data']['deleted'] = deleted;
    return data;
  }
}


