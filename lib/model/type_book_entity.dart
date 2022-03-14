import 'dart:convert';

T? asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }
  return null;
}

class TypeBookEntity {
  TypeBookEntity({
    this.id,
    this.workDirection,
    this.catId,
    this.catName,
    this.picUrl,
    this.bookName,
    this.authorId,
    this.authorName,
    this.bookDesc,
    this.score,
    this.bookStatus,
    this.visitCount,
    this.wordCount,
    this.commentCount,
    this.yesterdayBuy,
    this.lastIndexId,
    this.lastIndexName,
    this.lastIndexUpdateTime,
    this.isVip,
    this.status,
    this.updateTime,
    this.createTime,
    this.crawlSourceId,
    this.crawlBookId,
    this.crawlLastTime,
    this.crawlIsStop,
  });

  factory TypeBookEntity.fromJson(Map<String, dynamic> jsonRes) =>
      TypeBookEntity(
        id: asT<String?>(jsonRes['id']),
        workDirection: asT<Object?>(jsonRes['workDirection']),
        catId: asT<String?>(jsonRes['catId']),
        catName: asT<String?>(jsonRes['catName']),
        picUrl: asT<String?>(jsonRes['picUrl']),
        bookName: asT<String?>(jsonRes['bookName']),
        authorId: asT<Object?>(jsonRes['authorId']),
        authorName: asT<String?>(jsonRes['authorName']),
        bookDesc: asT<String?>(jsonRes['bookDesc']),
        score: asT<String?>(jsonRes['score']),
        bookStatus: asT<String?>(jsonRes['bookStatus']),
        visitCount: asT<Object?>(jsonRes['visitCount']),
        wordCount: asT<String?>(jsonRes['wordCount']),
        commentCount: asT<Object?>(jsonRes['commentCount']),
        yesterdayBuy: asT<Object?>(jsonRes['yesterdayBuy']),
        lastIndexId: asT<String?>(jsonRes['lastIndexId']),
        lastIndexName: asT<String?>(jsonRes['lastIndexName']),
        lastIndexUpdateTime: asT<String?>(jsonRes['lastIndexUpdateTime']),
        isVip: asT<Object?>(jsonRes['isVip']),
        status: asT<Object?>(jsonRes['status']),
        updateTime: asT<Object?>(jsonRes['updateTime']),
        createTime: asT<Object?>(jsonRes['createTime']),
        crawlSourceId: asT<Object?>(jsonRes['crawlSourceId']),
        crawlBookId: asT<Object?>(jsonRes['crawlBookId']),
        crawlLastTime: asT<Object?>(jsonRes['crawlLastTime']),
        crawlIsStop: asT<Object?>(jsonRes['crawlIsStop']),
      );

  String? id;
  Object? workDirection;
  String? catId;
  String? catName;
  String? picUrl;
  String? bookName;
  Object? authorId;
  String? authorName;
  String? bookDesc;
  String? score;
  String? bookStatus;
  Object? visitCount;
  String? wordCount;
  Object? commentCount;
  Object? yesterdayBuy;
  String? lastIndexId;
  String? lastIndexName;
  String? lastIndexUpdateTime;
  Object? isVip;
  Object? status;
  Object? updateTime;
  Object? createTime;
  Object? crawlSourceId;
  Object? crawlBookId;
  Object? crawlLastTime;
  Object? crawlIsStop;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'workDirection': workDirection,
    'catId': catId,
    'catName': catName,
    'picUrl': picUrl,
    'bookName': bookName,
    'authorId': authorId,
    'authorName': authorName,
    'bookDesc': bookDesc,
    'score': score,
    'bookStatus': bookStatus,
    'visitCount': visitCount,
    'wordCount': wordCount,
    'commentCount': commentCount,
    'yesterdayBuy': yesterdayBuy,
    'lastIndexId': lastIndexId,
    'lastIndexName': lastIndexName,
    'lastIndexUpdateTime': lastIndexUpdateTime,
    'isVip': isVip,
    'status': status,
    'updateTime': updateTime,
    'createTime': createTime,
    'crawlSourceId': crawlSourceId,
    'crawlBookId': crawlBookId,
    'crawlLastTime': crawlLastTime,
    'crawlIsStop': crawlIsStop,
  };
}
