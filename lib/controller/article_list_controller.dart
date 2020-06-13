import 'package:xes1v1_mobile/base/result.dart';
import 'package:xes1v1_mobile/model/article_list.dart';
import 'package:xes1v1_mobile/xes1v1_mobile.dart';

class ArticleListController extends ResourceController {
  ArticleListController(this.context);

  final ManagedContext context;

  //获取文章列表
  @Operation.get()
  FutureOr<Response> getArticle() async {
    //查询文章，并根据createDate进行排序
    final query = Query<ArticleList>(context)
      ..sortBy((e) => e.createData, QuerySortOrder.descending);
    final List<ArticleList> articles = await query.fetch();
    if (articles.isEmpty) {
      return Result.error("查询结果为空");
    }
    return Result.data(articles);
  }
}
