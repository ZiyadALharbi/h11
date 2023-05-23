import 'package:supabase/supabase.dart';

class SupabaseEnv {
  final _url = "__";
  final _key = "__";
  final _jwt = "__";

  get getJWT {
    return _jwt;
  }

  SupabaseClient get supabase {
    final supabase = SupabaseClient(_url, _key);

    return supabase;
  }
}
