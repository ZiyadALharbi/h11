import 'dart:convert';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:shelf/shelf.dart';

import '../../Services/Supabase/SupabaseEnv.dart';

userDisplayResponse(Request req)async{
  try{
    final jwt = JWT.decode(req.headers["authorization"]!);
    
    final supabase = SupabaseEnv().supabase;
    
     final user = (await supabase
      .from("users1")
      .select()
      .eq("id_auth", jwt.payload["sub"]))[0];

      final contact =
      await supabase.from("contact").select().eq("id_user", user["id"]);

      Map userMap = {...user, "contact": contact};

      return Response.ok(json.encode(userMap), headers:{"content-type": "application/json"});
  } catch (e) {
    return Response.internalServerError(body: "Sorry, try again later");
  }
}