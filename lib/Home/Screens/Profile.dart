import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:rpcstudentapp/Constants/Constants.dart';
import 'package:rpcstudentapp/Controller/auth_session.dart';
import 'package:rpcstudentapp/Controller/homepageController.dart';
import 'package:rpcstudentapp/Controller/profile.dart';
import 'package:rpcstudentapp/Widgets/dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends ConsumerStatefulWidget {
  const Profile({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileState();
}

class _ProfileState extends ConsumerState<Profile> {
  @override
  void initState() {
    ref.read(profilecontroller.notifier).getID();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(profilecontroller);
    final controller1 = ref.watch(homepagecontroller);
    return StreamBuilder<dynamic>(
        stream: controller.supabase
            .from("users")
            .stream(primaryKey: ['id']).eq("supabase_id", controller.userID),
        builder: (context, snapshot) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              elevation: 0.0,
              title: Padding(
                padding: const EdgeInsets.only(left: 5, top: 10),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          context.go("/homepage");
                        },
                        icon: SvgPicture.asset(CtrlSvg.back)),
                    const Text(
                      "Back",
                      style: TextStyle(
                        color: CtrlColors.black,
                        fontFamily: "GeneralSans",
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
                child: ListView.builder(
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.only(
                              top: 15, left: 10, right: 20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Text(
                                    'ID: ',
                                    style: TextStyle(
                                        fontFamily: 'GeneralSansRegular',
                                        color: CtrlColors.black,
                                        fontSize: 15.sp),
                                  ),
                                  10.horizontalSpace,
                                  Text(
                                    snapshot.hasData == true
                                        ? snapshot.data[0]['idNumber']
                                        : "",
                                    style: TextStyle(
                                        fontFamily: 'GeneralSans',
                                        color: CtrlColors.red,
                                        fontSize: 15.sp),
                                  ),
                                ],
                              ),
                              10.verticalSpace,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      Text(
                                        snapshot.hasData == true
                                            ? snapshot.data[0]['lastName']
                                                .split("")[0]
                                            : "",
                                        style: TextStyle(
                                            fontFamily: 'GeneralSans',
                                            color: CtrlColors.red,
                                            fontSize: 40.sp),
                                      ),
                                      Text(
                                        snapshot.hasData == true
                                            ? snapshot.data[0]['lastName']
                                                .substring(1)
                                            : "",
                                        style: TextStyle(
                                            fontFamily: 'GeneralSans',
                                            color: CtrlColors.black,
                                            fontSize: 40.sp),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      Text(
                                        snapshot.hasData == true
                                            ? snapshot.data[0]['firstName']
                                            : "",
                                        style: TextStyle(
                                            fontFamily: 'GeneralSans',
                                            color: CtrlColors.black,
                                            fontSize: 40.sp),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              10.verticalSpace,
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 130, top: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    Text(
                                      "Email",
                                      style: TextStyle(
                                          fontFamily: 'GeneralSansRegular',
                                          color: CtrlColors.black,
                                          fontSize: 13.sp),
                                    ),
                                    Text(
                                      snapshot.hasData == true
                                          ? snapshot.data[0]['email']
                                          : "",
                                      style: TextStyle(
                                          fontFamily: 'GeneralSans',
                                          color: CtrlColors.red,
                                          fontSize: 13.sp),
                                    ),
                                    20.verticalSpace,
                                    Text(
                                      'Mobile Number: ',
                                      style: TextStyle(
                                          fontFamily: 'GeneralSansRegular',
                                          color: CtrlColors.black,
                                          fontSize: 13.sp),
                                    ),
                                    Text(
                                      snapshot.hasData == true
                                          ? snapshot.data[0]['mobileNumber']
                                          : "",
                                      style: TextStyle(
                                          fontFamily: 'GeneralSans',
                                          color: CtrlColors.red,
                                          fontSize: 13.sp),
                                    ),
                                    20.verticalSpace,
                                    Text(
                                      'Birthday: ',
                                      style: TextStyle(
                                          fontFamily: 'GeneralSansRegular',
                                          color: CtrlColors.black,
                                          fontSize: 13.sp),
                                    ),
                                    Text(
                                      snapshot.hasData == true
                                          ? snapshot.data[0]['birth']
                                          : "",
                                      style: TextStyle(
                                          fontFamily: 'GeneralSans',
                                          color: CtrlColors.red,
                                          fontSize: 13.sp),
                                    ),
                                    // 20.verticalSpace,
                                    // Text(
                                    //   'Advisor: ',
                                    //   style: TextStyle(
                                    //       fontFamily: 'GeneralSansRegular',
                                    //       color: CtrlColors.black,
                                    //       fontSize: 13.sp),
                                    // ),
                                    // Text(
                                    //   'Jayce Mico Dignadice',
                                    //   style: TextStyle(
                                    //       fontFamily: 'GeneralSans',
                                    //       color: CtrlColors.red,
                                    //       fontSize: 13.sp),
                                    // ),
                                    20.verticalSpace,
                                    Text(
                                      'THESIS CODE:',
                                      style: TextStyle(
                                          fontFamily: 'GeneralSansRegular',
                                          color: CtrlColors.black,
                                          fontSize: 13.sp),
                                    ),
                                    Text(
                                      controller1.code ?? "",
                                      style: TextStyle(
                                          fontFamily: 'GeneralSans',
                                          color: CtrlColors.red,
                                          fontSize: 13.sp),
                                    ),
                                    40.verticalSpace,
                                    InkWell(
                                      onTap: () async {
                                        final prefs = await SharedPreferences
                                            .getInstance();
                                        DialogPop.dialogup(
                                            context: context,
                                            buttontext: "Yes",
                                            message: "Are you want to logout?",
                                            onpress: () {
                                              // GoRouter.of(context)
                                              //     .goNamed(StringRoutes.login);
                                              prefs.remove("supabase_id");
                                              prefs.remove("code");
                                              context.pop();
                                              ref
                                                  .read(sessionAuth.notifier)
                                                  .signOut();
                                            });
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset(CtrlSvg.logout),
                                          10.horizontalSpace,
                                          const Text(
                                            'LOG OUT',
                                            style: TextStyle(
                                                fontFamily:
                                                    'GeneralSansRegular',
                                                color: CtrlColors.black,
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              10.verticalSpace
                            ],
                          ));
                    })),
          );
        });
  }
}
