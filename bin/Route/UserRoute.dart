import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../Middleware/User/CheckToken_Middleware.dart';
import '../Response/User/EditUserProfileResponse.dart';
import '../Response/User/addContactRespone.dart';
import '../Response/User/deleteContactResponse.dart';
import '../Response/User/displayContactUserResponse.dart';
import '../Response/User/displayProfileResponse.dart';
import '../Response/User/userDisplayResponse.dart';

class UserRoute {
  Handler get handler {
    final router = Router()
      ..get("/user-display/<id>", userDisplayResponse)
      ..post('/delete-contact', deleteContactResponse)
      ..get('/profile', displayProfileResponse)
      ..post('/add_contact', addContactResponse)
<<<<<<< HEAD
      ..post('/edit_profile', EditUserProfileResponse);
=======
      ..post("/display-contact", displayContactUserResponse);
>>>>>>> caa8113352ab80412ac9e8240c83dcba50835175

    final pipline =
        Pipeline().addMiddleware(checkTokenMiddleware()).addHandler(router);

    return pipline;
  }
}
