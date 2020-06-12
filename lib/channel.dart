import 'model/article_list.dart';
import 'xes1v1_mobile.dart';

class Xes1v1MobileChannel extends ApplicationChannel {
  //可通过该实例操作数据库
  ManagedContext context;

  @override
  Future prepare() async {
    logger.onRecord.listen(
        (rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));

    final config = Xes1v1Configuration(options.configurationFilePath);
    context = contextWithConnectionInfo(config.database);
  }

  @override
  Controller get entryPoint {
    final router = Router();
    router.route("/example").linkFunction((request) async {
      return Response.ok({"key": "value"});
    });

    router.route('/queryAllArticle').linkFunction((request) async {
      final query = Query<ArticleList>(context); //拿到表的查询实例
      final List<ArticleList> articles = await query.fetch(); //查询所有数据
      return Response.ok(articles); //数据以json形式返回给客户端
    });

    return router;
  }

  //初始化连接数据库
  ManagedContext contextWithConnectionInfo(
      DatabaseConfiguration connectionInfo) {
    final dataModel = ManagedDataModel.fromCurrentMirrorSystem();
    final psc = PostgreSQLPersistentStore(
        connectionInfo.username,
        connectionInfo.password,
        connectionInfo.host,
        connectionInfo.port,
        connectionInfo.databaseName);

    return ManagedContext(dataModel, psc);
  }
}

class Xes1v1Configuration extends Configuration {
  Xes1v1Configuration(String fileName) : super.fromFile(File(fileName));

  DatabaseConfiguration database;
}
