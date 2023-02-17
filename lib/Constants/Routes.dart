import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rpcstudentapp/Auth/Login.dart';
import 'package:rpcstudentapp/Auth/Signup.dart';
import 'package:rpcstudentapp/Home/Home.dart';
import 'package:rpcstudentapp/Home/Screens/EditProfile.dart';
import 'package:rpcstudentapp/Home/Screens/History.dart';
import 'package:rpcstudentapp/Home/Screens/Homepage.dart';
import 'package:rpcstudentapp/Home/Screens/Notifications.dart';
import 'package:rpcstudentapp/Home/Screens/Profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StringRoutes {
  static const String login = 'login';
  static const String signup = 'signup';
  static const String home = 'home';
  static const String profile = 'profile';
  static const String editprofile = 'editprofile';
  static const String notification = 'notification';
  static const String history = 'history';
  static const String homepage = 'homepage';
}

final GlobalKey<NavigatorState> rootNavigator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> shellNavigator = GlobalKey(debugLabel: 'shell');
String? supabaseid;

getuser() async {
  final prefs = await SharedPreferences.getInstance();
  supabaseid = prefs.getString("supabase_id");
}

final routerKey = Provider<GoRouter>((ref) {
  getuser();
  return GoRouter(
    navigatorKey: rootNavigator,
    initialLocation: supabaseid == '' ? '/login' : '/homepage',
    redirect: (context, state) {
      return null;
    },
    routes: <RouteBase>[
      GoRoute(
        path: '/login',
        name: StringRoutes.login,
        builder: (context, state) {
          return Login(key: state.pageKey);
        },
      ),
      GoRoute(
        name: StringRoutes.signup,
        path: '/signup',
        builder: (context, state) {
          return Signup(
            key: state.pageKey,
          );
        },
      ),

      GoRoute(
        name: StringRoutes.profile,
        path: '/profile',
        builder: (BuildContext context, GoRouterState state) {
          return Profile(
            key: state.pageKey,
          );
        },
      ),
      GoRoute(
        name: StringRoutes.history,
        path: '/history',
        builder: (BuildContext context, GoRouterState state) {
          return History(key: state.pageKey);
        },
      ),

      ShellRoute(
        navigatorKey: shellNavigator,
        builder: (context, state, child) {
          return Home(child);
        },
        routes: [
          GoRoute(
            name: StringRoutes.homepage,
            path: '/homepage',
            builder: (BuildContext context, GoRouterState state) {
              return HomePage(
                key: state.pageKey,
              );
            },
          ),
          GoRoute(
            name: StringRoutes.editprofile,
            path: '/editprofile',
            builder: (BuildContext context, GoRouterState state) {
              return EditProfile(
                key: state.pageKey,
              );
            },
          ),
          GoRoute(
            name: StringRoutes.notification,
            path: '/notification',
            builder: (BuildContext context, GoRouterState state) {
              return NotifScreen(
                key: state.pageKey,
              );
            },
          ),
        ],
      ),
      // GoRoute(
      //   name: StringRoutes.profile,
      //   path: '/profile',
      //   builder: (BuildContext context, GoRouterState state) {
      //     return Profile(
      //       key: state.pageKey,
      //     );
      //   },
      // ),
      // GoRoute(
      //   name: StringRoutes.history,
      //   path: '/history',
      //   builder: (BuildContext context, GoRouterState state) {
      //     return History(key: state.pageKey);
      //   },
      // )
    ],
  );
});
