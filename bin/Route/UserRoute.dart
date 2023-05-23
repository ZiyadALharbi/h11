import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../Middleware/User/CheckToken_Middleware.dart';
import '../Response/User/deleteContactResponse.dart';
import '../Response/User/displayProfileResponse.dart';
import '../Response/User/userDisplayResponse.dart';

class UserRoute {
  Handler get handler {
    final router = Router()
      ..get("/user-display", userDisplayResponse)
      ..post('/delete-contact', deleteContactResponse)
      ..get('/profile', displayProfileResponse);
    final pipline =
        Pipeline().addMiddleware(checkTokenMiddleware()).addHandler(router);

    return pipline;
  }
}
