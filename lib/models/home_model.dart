import 'package:equatable/equatable.dart';

/// type : "horse"
/// data : {"totalAmount":"1,23,000","itemCount":100,"fileUrl":"https://upload.wikimedia.org/wikipedia/commons/7/74/Earth_poster_large.jpg"}
/// id : "1"

class HomeModel extends Equatable {
  HomeModel({
    required this.type,
    required this.data,
    required this.id,
  });

  HomeModel.fromJson(dynamic json) {
    type = json['type'];
    data = Data.fromJson(json['data']);
    id = json['id'];
  }

  late final String type;
  late final Data data;
  late final String id;

  HomeModel copyWith({
    String? type,
    Data? data,
    String? id,
  }) =>
      HomeModel(
        type: type ?? this.type,
        data: data ?? this.data,
        id: id ?? this.id,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['data'] = data.toJson();
    map['id'] = id;
    return map;
  }

  @override
  List<Object?> get props => [type, data, id];
}

/// totalAmount : "1,23,000"
/// itemCount : 100
/// fileUrl : "https://upload.wikimedia.org/wikipedia/commons/7/74/Earth_poster_large.jpg"

class Data extends Equatable {
  Data({
    required this.totalAmount,
    required this.itemCount,
    required this.fileUrl,
  });

  Data.fromJson(dynamic json) {
    totalAmount = json['totalAmount'];
    itemCount = json['itemCount'];
    fileUrl = json['fileUrl'];
  }

  late final String totalAmount;
  late final int itemCount;
  late final String fileUrl;

  Data copyWith({
    String? totalAmount,
    int? itemCount,
    String? fileUrl,
  }) =>
      Data(
        totalAmount: totalAmount ?? this.totalAmount,
        itemCount: itemCount ?? this.itemCount,
        fileUrl: fileUrl ?? this.fileUrl,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['totalAmount'] = totalAmount;
    map['itemCount'] = itemCount;
    map['fileUrl'] = fileUrl;
    return map;
  }

  @override
  List<Object?> get props => [totalAmount, itemCount, fileUrl];
}
