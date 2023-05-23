import 'dart:convert';
import 'dart:html';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:shelf/shelf.dart';
import '../../Services/Supabase/SupabaseEnv.dart';

editUserProfileResponse(Request req) async {
  final body = json.decode(await req.readAsString());
  final jwt = JWT.decode(req.headers["authorization"]!);

  final supabase = SupabaseEnv().supabase;

  final edit = await supabase
      .from("users1")
      .update({'name': 'sama'}).match(body['name'], body['email'], body['bio']);

  return Response.ok(
    json.encode(edit),
    headers: {"content-type": "application/json"},
  );
}