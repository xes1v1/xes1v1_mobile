import 'package:xes1v1_mobile/xes1v1_mobile.dart';

class ArticleList extends ManagedObject<_ArticleList> implements _ArticleList {}

class _ArticleList {
  @primaryKey
  int id;

  String title;

  String content;

  String tag;

  int articleID;

  String author;

  @Column(indexed: true)
  DateTime createData;
}
