import 'dart:convert';

T? asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }
  return null;
}

class CategoryEntity {
  CategoryEntity({
    required this.id,
    this.workDirection,
    this.name,
    this.sort,
    this.createUserId,
    this.createTime,
    this.updateUserId,
    this.updateTime,
  });

  factory CategoryEntity.fromJson(Map<String, dynamic> jsonRes) =>
      CategoryEntity(
        id: asT<String>(jsonRes['id'])!,
        workDirection: asT<String?>(jsonRes['workDirection']),
        name: asT<String?>(jsonRes['name']),
        sort: asT<Object?>(jsonRes['sort']),
        createUserId: asT<Object?>(jsonRes['createUserId']),
        createTime: asT<Object?>(jsonRes['createTime']),
        updateUserId: asT<Object?>(jsonRes['updateUserId']),
        updateTime: asT<Object?>(jsonRes['updateTime']),
      );

  String id;
  String? workDirection;
  String? name;
  Object? sort;
  Object? createUserId;
  Object? createTime;
  Object? updateUserId;
  Object? updateTime;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'workDirection': workDirection,
        'name': name,
        'sort': sort,
        'createUserId': createUserId,
        'createTime': createTime,
        'updateUserId': updateUserId,
        'updateTime': updateTime,
      };
}
