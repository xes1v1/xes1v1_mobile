import 'package:xes1v1_mobile/base/result.dart';
import 'package:xes1v1_mobile/model/article_list.dart';
import 'package:xes1v1_mobile/xes1v1_mobile.dart';

class ArticleController extends ResourceController {
  ArticleController(this.context);

  final ManagedContext context;

  //获取文章列表
  @Operation.get()
  FutureOr<Response> getArticle(
      {@Bind.query('articleID') int articleID}) async {
    if (articleID != null) {
      final query = Query<ArticleList>(context)
        ..where((a) => a.articleID).equalTo(articleID);
      final article = await query.fetchOne();
      if (article != null) {
        return Result.data(article);
      } else {
        return Result.error("没有找到指定文章");
      }
    } else {
      return Response.notFound();
    }
  }
}
