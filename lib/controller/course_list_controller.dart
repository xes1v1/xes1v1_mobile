import 'package:xes1v1_mobile/base/result.dart';
import 'package:xes1v1_mobile/model/course_list.dart';
import 'package:xes1v1_mobile/xes1v1_mobile.dart';

class CourseListController extends ResourceController {
  CourseListController(this.context);

  final ManagedContext context;

  //获取课程列表
  @Operation.get()
  FutureOr<Response> getCourseList() async {
    final query = Query<CourseList>(context);
    final List<CourseList> courseList = await query.fetch();
    if (courseList.isEmpty) {
      return Result.error("查询结果为空");
    }
    return Result.data(courseList);
  }
}
