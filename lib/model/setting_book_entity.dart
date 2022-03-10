import 'dart:convert';

T? asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }
  return null;
}

class SettingBookEntity {
  SettingBookEntity({
    this.id,
    this.bookId,
    this.sort,
    this.type,
    this.createTime,
    this.createUserId,
    this.updateTime,
    this.updateUserId,
    this.bookName,
    this.picUrl,
    this.authorName,
    this.bookDesc,
    this.score,
    this.catId,
    this.catName,
    this.bookStatus,
  });

  factory SettingBookEntity.fromJson(Map<String, dynamic> jsonRes) =>
      SettingBookEntity(
        id: asT<Object?>(jsonRes['id']),
        bookId: asT<String?>(jsonRes['bookId']),
        sort: asT<String?>(jsonRes['sort']),
        type: asT<String?>(jsonRes['type']),
        createTime: asT<String?>(jsonRes['createTime']),
        createUserId: asT<Object?>(jsonRes['createUserId']),
        updateTime: asT<String?>(jsonRes['updateTime']),
        updateUserId: asT<Object?>(jsonRes['updateUserId']),
        bookName: asT<String?>(jsonRes['bookName']),
        picUrl: asT<String?>(jsonRes['picUrl']),
        authorName: asT<String?>(jsonRes['authorName']),
        bookDesc: asT<String?>(jsonRes['bookDesc']),
        score: asT<String?>(jsonRes['score']),
        catId: asT<Object?>(jsonRes['catId']),
        catName: asT<Object?>(jsonRes['catName']),
        bookStatus: asT<Object?>(jsonRes['bookStatus']),
      );

  Object? id;
  String? bookId;
  String? sort;
  String? type;
  String? createTime;
  Object? createUserId;
  String? updateTime;
  Object? updateUserId;
  String? bookName;
  String? picUrl;
  String? authorName;
  String? bookDesc;
  String? score;
  Object? catId;
  Object? catName;
  Object? bookStatus;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'bookId': bookId,
    'sort': sort,
    'type': type,
    'createTime': createTime,
    'createUserId': createUserId,
    'updateTime': updateTime,
    'updateUserId': updateUserId,
    'bookName': bookName,
    'picUrl': picUrl,
    'authorName': authorName,
    'bookDesc': bookDesc,
    'score': score,
    'catId': catId,
    'catName': catName,
    'bookStatus': bookStatus,
  };
}

