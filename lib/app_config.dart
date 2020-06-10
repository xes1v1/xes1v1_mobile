import 'package:xes1v1_mobile/xes1v1_mobile.dart';

class AppConfig extends Configuration {

  AppConfig(String path):super.fromFile(File(path));

  int port;

  DatabaseConfiguration database;
}