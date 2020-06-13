import 'package:xes1v1_mobile/xes1v1_mobile.dart';

class FrameList extends ManagedObject<_FrameList> implements _FrameList {}

class _FrameList {
  @primaryKey
  int id;

  String imgurl;

  String title;

  String content;

  int frameID;

  DateTime createData;
}
