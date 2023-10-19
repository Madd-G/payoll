class ProductModel {
  List<Data>? data;

  ProductModel({this.data});

  ProductModel.fromJson(Map<String, dynamic> json) {
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
  String? code;
  String? description;
  String? nominal;
  String? details;
  int? price;
  String? type;
  String? category;
  int? activePeriod;
  String? status;
  String? iconUrl;
  String? created;
  String? updated;
  String? deleted;

  Data({
    this.id,
    this.code,
    this.description,
    this.nominal,
    this.details,
    this.price,
    this.type,
    this.category,
    this.activePeriod,
    this.status,
    this.iconUrl,
    this.created,
    this.updated,
    this.deleted,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    code = json['code'];
    description = json['description'];
    nominal = json['nominal'];
    details = json['details'];
    price = json['price'];
    type = json['type'];
    category = json['category'];
    activePeriod = json['active_period'];
    status = json['status'];
    iconUrl = json['icon_url'];
    created = json['created'];
    updated = json['updated'];
    deleted = json['deleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['code'] = code;
    data['description'] = description;
    data['nominal'] = nominal;
    data['details'] = details;
    data['price'] = price;
    data['type'] = type;
    data['category'] = category;
    data['active_period'] = activePeriod;
    data['status'] = status;
    data['icon_url'] = iconUrl;
    data['created'] = created;
    data['updated'] = updated;
    data['deleted'] = deleted;
    return data;
  }
}
