import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../Middleware/User/CheckToken_Middleware.dart';
import '../Response/user/deletcontact/deletcontact.dart';

class UserRoute {
  Handler get handler {
    final router = Router()..post('/deletcontact', deletcontact);
    final pipline =
        Pipeline().addMiddleware(checkTokenMiddleware()).addHandler(router);

    return pipline;
  }
}
