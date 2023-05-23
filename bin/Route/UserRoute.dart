import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../Middleware/User/CheckToken_Middleware.dart';
import '../Response/User/deleteContactResponse.dart';
import '../Response/User/displayProfileResponse.dart';
import '../Response/User/userDisplayResponse.dart';

class UserRoute {
  Handler get handler {
    final router = Router()
<<<<<<< HEAD
      ..get("/user-display", userDisplayResponse)
      ..post('/delete-contact', deleteContactResponse)
      ..get('/profile', displayProfileResponse)..post('/add_contact', addContactResponse);
=======
    ..get("/user-display/<id>", userDisplayResponse)
    ..post('/delete-contact', deleteContactResponse);
>>>>>>> 5365d2448c90b79ff55b6ecf61de33bd44d11160
    final pipline =
        Pipeline().addMiddleware(checkTokenMiddleware()).addHandler(router);

    return pipline;
  }
}
