// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:rpcstudentapp/Constants/Constants.dart';
import 'package:rpcstudentapp/Constants/Routes.dart';
import 'package:rpcstudentapp/Controller/homepageController.dart';
import 'package:rpcstudentapp/Widgets/BottomBarIndicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final index = AutoDisposeStateProvider<int>((ref) => 0);

class Home extends ConsumerStatefulWidget {
  final Widget child;

  const Home(this.child, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      new FlutterLocalNotificationsPlugin();
  @override
  void initState() {
    ref.read(homepagecontroller.notifier).getUser();
    // var initializationSettingsAndroid =new AndroidInitializationSettings('app_icon');
    // var initializationSettingsIOS = new IOSInitializationSettings();
    // var initializationSettings = new InitializationSettings(initializationSettingsAndroid, initializationSettingsIOS);
    // flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    // flutterLocalNotificationsPlugin.initialize(initializationSettings,selectNotification: onSelectNotification);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final indexPage = ref.watch(index);
    final controller = ref.watch(homepagecontroller);

    return StreamBuilder<dynamic>(
        stream: controller.supabase.from("users").stream(primaryKey: ['id']).eq("supabase_id", controller.userID),
        builder: (context, snapshot) {
          return Scaffold(
              backgroundColor: Colors.white,
              key: scaffoldKey,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                toolbarHeight: 130.h,
                backgroundColor: Colors.white,
                elevation: 0.0,
                title: SizedBox(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
                  child: Column(
                    children: [
                      Row(children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: IconButton(
                              onPressed: () {
                                scaffoldKey.currentState!.openDrawer();
                              },
                              icon: Icon(
                                Icons.menu_rounded,
                                color: CtrlColors.red,
                                size: 30,
                              )),
                        ),
                        10.horizontalSpace,
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Row(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Text(
                                    "W",
                                    style: TextStyle(
                                        fontFamily: 'GeneralSans',
                                        fontSize: 38.sp,
                                        color: CtrlColors.red),
                                  ),
                                  Text(
                                    "elcome!",
                                    style: TextStyle(
                                        fontFamily: 'GeneralSans',
                                        fontSize: 38.sp,
                                        color: CtrlColors.black),
                                  ),
                                ],
                              ),
                              Text(
                                snapshot.hasData == true
                                    ? "${snapshot.data[0]['firstName']}, ${snapshot.data[0]['lastName']}"
                                    : "",
                                style: TextStyle(
                                    fontFamily: 'GeneralSansRegular',
                                    fontSize: 15.sp,
                                    color: CtrlColors.black),
                              ),
                            ],
                          ),
                        ),
                        50.horizontalSpace,
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: IconButton(
                            onPressed: () {
                              showGeneralDialog(
                                  barrierLabel: '',
                                  barrierDismissible: true,
                                  context: context,
                                  transitionDuration:
                                      const Duration(milliseconds: 200),
                                  transitionBuilder: (a, b, c, d) {
                                    return Transform.scale(
                                      scale: b.value,
                                      child: Opacity(
                                        opacity: b.value,
                                        child: Dialog(
                                          alignment: Alignment.center,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              12.verticalSpace,
                                              Container(
                                                padding: EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                ),
                                                height: 200.h,
                                                width: 200.w,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 10, left: 10),
                                                  child: Column(
                                                    // ignore: prefer_const_literals_to_create_immutables
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                right: 50),
                                                        child: Text(
                                                          'Enter Code: ',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'GeneralSans',
                                                              fontSize: 15.sp,
                                                              color: CtrlColors
                                                                  .black),
                                                        ),
                                                      ),
                                                      10.verticalSpace,
                                                      Container(
                                                        width: 200.w,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        child: TextFormField(
                                                          keyboardType:
                                                              TextInputType
                                                                  .text,
                                                          decoration:
                                                              InputDecoration(
                                                            filled: true,
                                                            floatingLabelBehavior:
                                                                FloatingLabelBehavior
                                                                    .auto,
                                                            floatingLabelStyle:
                                                                const TextStyle(
                                                                    color:
                                                                        CtrlColors
                                                                            .red),
                                                            labelText:
                                                                "VG657BN",
                                                            labelStyle: TextStyle(
                                                                fontFamily:
                                                                    "GeneralSans",
                                                                fontSize: 12.sp,
                                                                color: Color(
                                                                    0xFF404042)),
                                                            prefixIcon: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 20,
                                                                      right:
                                                                          20),
                                                              child: SvgPicture
                                                                  .asset(
                                                                CtrlSvg
                                                                    .giftCode,
                                                                height: 18.h,
                                                                width: 18.w,
                                                              ),
                                                            ),
                                                            border: InputBorder
                                                                .none,
                                                            focusedBorder:
                                                                InputBorder
                                                                    .none,
                                                            enabledBorder:
                                                                InputBorder
                                                                    .none,
                                                          ),
                                                        ),
                                                      ),
                                                      15.verticalSpace,
                                                      ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5)),
                                                            backgroundColor:
                                                                const Color(
                                                                    0xFFEC4969),
                                                          ),
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Center(
                                                            child: Text(
                                                              'Submit Code',
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'GeneralSans',
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      15.sp),
                                                            ),
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  pageBuilder: (BuildContext context,
                                      Animation<double> animation,
                                      Animation<double> secondaryAnimation) {
                                    return const SizedBox.shrink();
                                  });
                            },
                            icon: SvgPicture.asset(CtrlSvg.addCode),
                          ),
                        )
                      ]),
                      10.verticalSpace,
                      Padding(
                        padding: const EdgeInsets.only(left: 12, right: 12),
                        child: SizedBox(
                          width: double.infinity,
                          child: Divider(
                            thickness: 1.0,
                            color: CtrlColors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
              ),
              drawer: Drawer(
                  width: 230.w,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, top: 80),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 6),
                              child: SvgPicture.asset(
                                CtrlSvg.rpc,
                                width: 60.w,
                                height: 60.h,
                              ),
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 1),
                                      child: Text(
                                        "R",
                                        style: TextStyle(
                                          color: CtrlColors.red,
                                          fontFamily: "GeneralSans",
                                          fontSize: 32.sp,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 1),
                                      child: Text(
                                        "PC",
                                        style: TextStyle(
                                          color: CtrlColors.black,
                                          fontFamily: "GeneralSans",
                                          fontSize: 32.sp,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "Student App",
                                  style: TextStyle(
                                    color: CtrlColors.black,
                                    fontFamily: "GeneralSans",
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 25),
                              child: Text(
                                snapshot.hasData == true
                                    ? snapshot.data[0]['idNumber']
                                    : "",
                                style: TextStyle(
                                  color: CtrlColors.red,
                                  fontFamily: "GeneralSans",
                                  fontSize: 13.5.sp,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 1),
                              child: Text(
                                snapshot.hasData == true
                                    ? "${snapshot.data[0]['firstName']}, ${snapshot.data[0]['lastName']}"
                                    : "",
                                style: TextStyle(
                                  color: CtrlColors.black,
                                  fontFamily: "GeneralSans",
                                  fontSize: 13.5.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 40),
                          child: SizedBox(
                            width: 150,
                            child: Divider(
                              thickness: 0.5,
                              color: CtrlColors.black,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            context.go("/profile");
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10, right: 60),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(CtrlSvg.signupperson),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    Text(
                                      "PROFILE",
                                      style: TextStyle(
                                        color: CtrlColors.black,
                                        fontFamily: "GeneralSans",
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        20.verticalSpace,
                        InkWell(
                          onTap: () {
                            context.go("/history");
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10, right: 60),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(CtrlSvg.time),
                                    20.horizontalSpace,
                                    Text(
                                      "HISTORY",
                                      style: TextStyle(
                                        color: CtrlColors.black,
                                        fontFamily: "GeneralSans",
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: SizedBox(
                            width: 150.w,
                            child: Divider(
                              thickness: 0.5,
                              color: CtrlColors.black,
                            ),
                          ),
                        ),
                        20.verticalSpace,
                        InkWell(
                          onTap: () {
                            controller.removeuser(context: context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10, right: 60),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(CtrlSvg.logout),
                                    20.horizontalSpace,
                                    Text(
                                      "LOGOUT",
                                      style: TextStyle(
                                        color: CtrlColors.black,
                                        fontFamily: "GeneralSans",
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
              bottomNavigationBar: BottomIndicatorBar(
                currentIndex: indexPage,
                onTap: (int i) {
                  onTap(i);
                  // print(ref.watch(index.notifier).state);
                },
                shadow: false,
                activeColor: CtrlColors.red,
                inactiveColor: const Color(0xFF404042),
                indicatorColor: CtrlColors.red,
                items: [
                  BottomIndicatorNavigationBarItem(
                    icon: CtrlSvg.home,
                    count: 0,
                    showBadge: false,
                  ),
                  BottomIndicatorNavigationBarItem(
                    icon: CtrlSvg.signupgrey,
                    count: 0,
                    showBadge: false,
                  ),
                  BottomIndicatorNavigationBarItem(
                    icon: CtrlSvg.notif,
                    count: 0,
                    showBadge: false,
                  ),
                ],
              ),
              body: widget.child);
        });
  }

  onTap(int? i) {
    ref.read(index.notifier).state = i!;
    switch (i) {
      case 0:
        context.goNamed(StringRoutes.homepage);
        break;
      case 1:
        context.goNamed(StringRoutes.editprofile);
        break;
      case 2:
        context.goNamed(StringRoutes.notification);
        break;
      default:
    }
  }
}
