import 'package:xes1v1_mobile/base/result.dart';
import 'package:xes1v1_mobile/model/course_list.dart';
import 'package:xes1v1_mobile/model/honor_list.dart';
import 'package:xes1v1_mobile/xes1v1_mobile.dart';

class HonorListController extends ResourceController {
  HonorListController(this.context);

  final ManagedContext context;

  //获取荣誉列表
  @Operation.get()
  FutureOr<Response> getHonorList() async {
    final query = Query<HonorList>(context);
    final List<HonorList> honorList = await query.fetch();
    if (honorList.isEmpty) {
      return Result.error("查询结果为空");
    }
    return Result.data(honorList);
  }
}
