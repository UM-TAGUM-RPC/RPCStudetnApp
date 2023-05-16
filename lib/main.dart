import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rpcstudentapp/Class/notif.dart';
import 'package:rpcstudentapp/Constants/Routes.dart';
import 'package:rpcstudentapp/Controller/auth_session.dart';
import 'package:rpcstudentapp/Controller/firebasePushNotification.dart';
import 'package:rpcstudentapp/Controller/sharedPref.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
const AndroidNotificationChannel channel = AndroidNotificationChannel(
  "hig_importance_channel",
  "High Importance Notification",
  description: "This channel is used for important notifications",
  importance: Importance.high,
  playSound: true,
  enableVibration: true,
);
Future<void> messagehandling(RemoteMessage? message) async {
  await Firebase.initializeApp();
  RemoteNotification? notification = message!.notification;
  AndroidNotification? android = message.notification?.android;
  if (notification != null && android != null) {
  } else {}
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SharedPrefs.init();
  await Supabase.initialize(
    url: "https://miojbztjrzdmwdyzhdoy.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1pb2pienRqcnpkbXdkeXpoZG95Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzQwNDUwMzgsImV4cCI6MTk4OTYyMTAzOH0.S1B4_GbHE2veNNOEgeIddP7t4LOfaGM6y2AF-gvMRh4",
  );
  await ScreenUtil.ensureScreenSize();
  WidgetsFlutterBinding.ensureInitialized();
  NotificationServices().initNotification();
  runApp(const ProviderScope(child: MyApp()));
  final prefs = await SharedPreferences.getInstance();
  prefs.getString("supabase_id");
  FirebaseMessaging.onBackgroundMessage(messagehandling);
}


getID() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.getString("supabase_id");
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    ref.read(sessionAuth.notifier).statusUserAunthenticated();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(routerKey);
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routeInformationParser: router.routeInformationParser,
            routeInformationProvider: router.routeInformationProvider,
            routerDelegate: router.routerDelegate,
          );
        });
  }
}
