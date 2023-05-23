import 'dart:convert';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:shelf/shelf.dart';

import '../../Services/Supabase/SupabaseEnv.dart';

deleteContactResponse(Request req, int idcontact) async {
  final body = json.decode(await req.readAsString());
  final jwt = JWT.decode(req.headers["authorization"]!);
  final userAuth = jwt.payload["sub"];
  final supabase = SupabaseEnv().supabase;

  final result =
      await supabase.from("users1").select("id").eq("id_auth", userAuth);

  final resultContact =
      await supabase.from("contact1").select().eq("id_user", result[0]["id"]);
  supabase.from("contact1").delete().match(body["platform"]);

  return Response.ok(
    json.encode(resultContact),
    headers: {"content-type": "application/json"},
  );
}
