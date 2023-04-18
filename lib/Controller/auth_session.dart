import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final sessionAuth = ChangeNotifierProvider((ref) => AuthSession());
final isDuplicate = StateProvider<bool>((ref) => false);

enum StatusAuth { authenticated, unauthenticated, blank }

class AuthSession extends ChangeNotifier {
  final supabaseService = Supabase.instance.client;
  StatusAuth state = StatusAuth.blank;
  StatusAuth get statusAuth => state;

  // tawaga ni balik sa pag sign in nimu og out
  void statusUserAunthenticated() async {
    supabaseService.auth.onAuthStateChange.listen((data) async {
      final prefs = await SharedPreferences.getInstance();
      var id = prefs.getString("supabase_id");
      if (id != null || id != "") {
        state = StatusAuth.authenticated;
        notifyListeners();
      } else {
        state = StatusAuth.unauthenticated;
        notifyListeners();
        if (data.session != null) {
          log(data.session!.user.email!, name: "EMAIL");
          state = StatusAuth.authenticated;
          notifyListeners();
        } else {
          state = StatusAuth.unauthenticated;
          notifyListeners();
        }
      }
    });
  }

  void signOut() async {
    state = StatusAuth.unauthenticated;
    log(state.toString(), name: "AUTH STATE");
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("supabase_id");
    await prefs.remove("code");
    supabaseService.auth.signOut();
    notifyListeners();
  }
}
