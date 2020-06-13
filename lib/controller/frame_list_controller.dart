import 'package:xes1v1_mobile/base/result.dart';
import 'package:xes1v1_mobile/model/article_list.dart';
import 'package:xes1v1_mobile/model/frame_list.dart';
import 'package:xes1v1_mobile/xes1v1_mobile.dart';

class FrameListController extends ResourceController {
  FrameListController(this.context);

  final ManagedContext context;

  //获取文章列表
  @Operation.get()
  FutureOr<Response> getFrameList() async {
    //查询文章，并根据createDate进行排序
    final query = Query<FrameList>(context)
      ..sortBy((e) => e.createData, QuerySortOrder.descending);
    final List<FrameList> articles = await query.fetch();
    if (articles.isEmpty) {
      return Result.error("查询结果为空");
    }
    return Result.data(articles);
  }
}
