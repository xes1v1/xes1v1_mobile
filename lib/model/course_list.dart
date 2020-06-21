import 'package:xes1v1_mobile/xes1v1_mobile.dart';

class CourseList extends ManagedObject<_CourseList> implements _CourseList {}

class _CourseList {
  @primaryKey
  int id;

  String title;

  String link;

  String imgurl;

  String author;
}
