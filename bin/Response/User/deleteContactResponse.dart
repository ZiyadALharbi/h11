import 'dart:convert';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:shelf/shelf.dart';

import '../../Services/Supabase/SupabaseEnv.dart';

deleteContactResponse(Request req) async {
  final body = json.decode(await req.readAsString());
  final jwt = JWT.decode(req.headers["authorization"]!);
  final userAuth = jwt.payload["sub"];
  final supabase = SupabaseEnv().supabase;

  final result =
      await supabase.from("users").select("id").eq("id_auth", userAuth);

  final resultContact = await supabase
      .from("contact")
      .select(body["platform"])
      .eq("id_user", result[0]["id"]);
  supabase.from("contact").delete().match(body["platform"]);

  return Response.ok(
    json.encode(resultContact),
    headers: {"content-type": "application/json"},
  );
}