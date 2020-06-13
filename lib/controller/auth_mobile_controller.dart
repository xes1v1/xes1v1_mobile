import 'package:xes1v1_mobile/base/result.dart';
import 'package:xes1v1_mobile/xes1v1_mobile.dart';

class AuthMobileController extends ResourceController {

  //查询接口认证
  @override
  FutureOr<RequestOrResponse> handle(Request request) {
    final headers = request.raw.headers;
    final token = headers.value("token");
    if (token == "xes1v1_mobile") {
      return request;
    }
    return Result.error("认证不通过！");
  }
}
