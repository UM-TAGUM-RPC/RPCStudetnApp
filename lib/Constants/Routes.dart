import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rpcstudentapp/Auth/Login.dart';
import 'package:rpcstudentapp/Auth/Signup.dart';
import 'package:rpcstudentapp/Home/Home.dart';
import 'package:rpcstudentapp/Home/Screens/EditProfile.dart';
import 'package:rpcstudentapp/Home/Screens/History.dart';
import 'package:rpcstudentapp/Home/Screens/Notifications.dart';
import 'package:rpcstudentapp/Home/Screens/Profile.dart';

class StringRoutes {
  static const String login = 'login';
  static const String signup = 'signup';
  static const String home = 'home';
  static const String profile = 'profile';
  static const String editprofile = 'editprofile';
  static const String notification = 'notification';
  static const String history = 'history';
}

final GlobalKey<NavigatorState> rootNavigator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> shellNavigator = GlobalKey(debugLabel: 'shell');

class AppRoutes {
  final route = Provider<GoRouter>(((ref) {
    return GoRouter(
      navigatorKey: rootNavigator,
      initialLocation: '/',
      debugLogDiagnostics: true,
      redirect: (context, state) {
        return null;
      },
      routes: <RouteBase>[
        // GoRoute(
        //   path: '/home',
        //   name: StringRoutes.home,
        //   builder: (context, state) => Home(key: state.pageKey),
        // ),
        // GoRoute(
        //   path: '/login',
        //   name: StringRoutes.login,
        //   builder: (context, state) => Login(key: state.pageKey),
        // ),
        ShellRoute(
            navigatorKey: shellNavigator,
            
            builder: (context, state, child) {
              return Home(
                child,
                key: state.pageKey,
              );
            },
            routes: [
              GoRoute(
                name: StringRoutes.signup,
                path: '/signup',
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return MaterialPage(
                      child: Signup(
                    key: state.pageKey,
                  ));
                },
              ),
              GoRoute(
                name: StringRoutes.profile,
                path: '/profile',
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return MaterialPage(
                      child: Profile(
                    key: state.pageKey,
                  ));
                },
              ),
              GoRoute(
                name: StringRoutes.editprofile,
                path: '/editprofile',
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return MaterialPage(
                      child: EditProfile(
                    key: state.pageKey,
                  ));
                },
              ),
              GoRoute(
                name: StringRoutes.notification,
                path: '/notification',
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return MaterialPage(
                      child: NotifScreen(
                    key: state.pageKey,
                  ));
                },
              ),
              GoRoute(
                name: StringRoutes.history,
                path: '/history',
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return MaterialPage(child: History(key: state.pageKey));
                },
              )
            ])
      ],
    );
  }));
}
