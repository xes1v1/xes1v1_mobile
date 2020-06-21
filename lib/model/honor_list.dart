import 'package:xes1v1_mobile/xes1v1_mobile.dart';

class HonorList extends ManagedObject<_HonorList> implements _HonorList {}

class _HonorList {
  @primaryKey
  int id;

  String title;

  String info;

  String imgurl;
}
