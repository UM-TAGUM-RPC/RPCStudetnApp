import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:rpcstudentapp/Constants/Constants.dart';
import 'package:rpcstudentapp/Constants/Routes.dart';
import 'package:rpcstudentapp/Widgets/BottomBarIndicator.dart';

final index = AutoDisposeStateProvider<int>((ref) => 0);

class Home extends ConsumerStatefulWidget {
  final Widget child;

  const Home(this.child, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final indexPage = ref.watch(index);
    return Scaffold(
        key: scaffoldKey,
        drawer: Drawer(
            width: 230,
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 80),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: SvgPicture.asset(
                          CtrlSvg.rpc,
                          width: 60,
                          height: 60,
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 1),
                                child: Text(
                                  "R",
                                  style: TextStyle(
                                    color: CtrlColors.red,
                                    fontFamily: "GeneralSans",
                                    fontSize: 32,
                                  ),
                                ),
                              ),
                              // ignore: prefer_const_constructors
                              Padding(
                                padding: const EdgeInsets.only(top: 1),
                                child: const Text(
                                  "PC",
                                  style: TextStyle(
                                    color: CtrlColors.black,
                                    fontFamily: "GeneralSans",
                                    fontSize: 32,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            "Student App",
                            style: TextStyle(
                              color: CtrlColors.black,
                              fontFamily: "GeneralSans",
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 25),
                        child: Text(
                          "1234435",
                          style: TextStyle(
                            color: CtrlColors.red,
                            fontFamily: "GeneralSans",
                            fontSize: 13.5,
                          ),
                        ),
                      ),
                      // ignore: prefer_const_constructors
                      Padding(
                        padding: const EdgeInsets.only(top: 1),
                        child: const Text(
                          "Dignadice, Jayce Mico",
                          style: TextStyle(
                            color: CtrlColors.black,
                            fontFamily: "GeneralSans",
                            fontSize: 13.5,
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
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, right: 60),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(CtrlSvg.signupperson),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                "PROFILE",
                                style: TextStyle(
                                  color: CtrlColors.black,
                                  fontFamily: "GeneralSans",
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, right: 60),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(CtrlSvg.time),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                "HISTORY",
                                style: TextStyle(
                                  color: CtrlColors.black,
                                  fontFamily: "GeneralSans",
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: SizedBox(
                      width: 150,
                      child: Divider(
                        thickness: 0.5,
                        color: CtrlColors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, right: 60),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(CtrlSvg.logout),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                "LOGOUT",
                                style: TextStyle(
                                  color: CtrlColors.black,
                                  fontFamily: "GeneralSans",
                                  fontSize: 12,
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
  }

  onTap(int? i) {
    ref.read(index.notifier).state = i!;
    switch (i) {
      case 0:
        context.goNamed(StringRoutes.home);
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
