import 'package:xes1v1_mobile/base/result.dart';
import 'package:xes1v1_mobile/model/article_list.dart';
import 'package:xes1v1_mobile/model/frame_list.dart';
import 'package:xes1v1_mobile/xes1v1_mobile.dart';

class FrameController extends ResourceController {
  FrameController(this.context);

  final ManagedContext context;

  //根据框架id获取框架信息
  @Operation.get()
  FutureOr<Response> getFrame({@Bind.query('frameID') int frameID}) async {
    if (frameID != null) {
      final query = Query<FrameList>(context)
        ..where((a) => a.frameID).equalTo(frameID);
      final article = await query.fetchOne();
      if (article != null) {
        return Result.data(article);
      } else {
        return Result.error("没有找到指定框架信息");
      }
    } else {
      return Response.notFound();
    }
  }
}
