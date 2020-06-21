import 'package:xes1v1_mobile/base/result.dart';
import 'package:xes1v1_mobile/model/frame_list.dart';
import 'package:xes1v1_mobile/xes1v1_mobile.dart';

class FrameListController extends ResourceController {
  FrameListController(this.context);

  final ManagedContext context;

  //获取框架列表
  @Operation.get()
  FutureOr<Response> getFrameList() async {
    //查询框架，并根据createDate进行排序
    final query = Query<FrameList>(context)
      ..sortBy((e) => e.createData, QuerySortOrder.descending);
    final List<FrameList> frameList = await query.fetch();
    if (frameList.isEmpty) {
      return Result.error("查询结果为空");
    }
    return Result.data(frameList);
  }
}
