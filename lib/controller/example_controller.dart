import 'package:xes1v1_mobile/xes1v1_mobile.dart';

class ExampleController extends ResourceController {
  @Operation.get()
  FutureOr<Response> getArticle() async {
    return Response.ok({'data': 'Hello World'});
  }
}
