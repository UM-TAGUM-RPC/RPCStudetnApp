import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:rpcstudentapp/Constants/Constants.dart';
import 'package:rpcstudentapp/Home/Screens/EditProfile.dart';
import 'package:rpcstudentapp/Home/Screens/History.dart';
import 'package:rpcstudentapp/Home/Screens/Homepage.dart';
import 'package:rpcstudentapp/Home/Screens/Notifications.dart';
import 'package:rpcstudentapp/Home/Screens/Profile.dart';
import 'package:rpcstudentapp/Widgets/BottomBarIndicator.dart';

final index = StateProvider<int>((ref) => 0);

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  
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
          onTap: (int i) {
            ref.read(index.notifier).state = i;
            print(ref.watch(index.notifier).state);
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
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 60),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            // ignore: prefer_const_constructors
                            IconButton(
                                onPressed: () {
                                  scaffoldKey.currentState!.openDrawer();
                                },
                                icon: const Icon(
                                  Icons.menu,
                                  size: 35,
                                  color: CtrlColors.red,
                                )),
                            const SizedBox(
                              width: 25,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 1),
                              child: Text(
                                "W",
                                style: TextStyle(
                                  color: CtrlColors.red,
                                  fontFamily: "GeneralSans",
                                  fontSize: 35,
                                ),
                              ),
                            ),
                            // ignore: prefer_const_constructors
                            Padding(
                              padding: const EdgeInsets.only(top: 1),
                              child: const Text(
                                "elcome!",
                                style: TextStyle(
                                  color: CtrlColors.black,
                                  fontFamily: "GeneralSans",
                                  fontSize: 35,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 70,
                            ),
                            InkWell(
                              child: SvgPicture.asset(
                                CtrlSvg.addCode,
                              ),
                              onTap: () {
                                showGeneralDialog(
                                    barrierLabel: "",
                                    barrierDismissible: true,
                                    context: context,
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
                                                Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                    ),
                                                    height: 250,
                                                    width: 200,
                                                    child: Column(
                                                      children: [
                                                        const SizedBox(
                                                          height: 30,
                                                        ),
                                                        const Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 100),
                                                          child: Text(
                                                            'Enter Code:',
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'GeneralSans',
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 12),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 20,
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                          child: TextFormField(
                                                            keyboardType:
                                                                TextInputType
                                                                    .text,
                                                            decoration:
                                                                InputDecoration(
                                                                    filled:
                                                                        true,
                                                                    floatingLabelBehavior:
                                                                        FloatingLabelBehavior
                                                                            .never,
                                                                    floatingLabelStyle: const TextStyle(
                                                                        color: CtrlColors
                                                                            .red),
                                                                    contentPadding: const EdgeInsets
                                                                            .symmetric(
                                                                        horizontal:
                                                                            10),
                                                                    labelText:
                                                                        "VG657BN",
                                                                    labelStyle: const TextStyle(
                                                                        fontFamily:
                                                                            "GeneralSans",
                                                                        fontSize:
                                                                            15,
                                                                        color:
                                                                            Color(
                                                                                0xFF404042)),
                                                                    prefixIcon:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          left:
                                                                              20,
                                                                          right:
                                                                              20),
                                                                      child: SvgPicture
                                                                          .asset(
                                                                        CtrlSvg
                                                                            .giftCode,
                                                                        height:
                                                                            18,
                                                                        width:
                                                                            18,
                                                                      ),
                                                                    ),
                                                                    border:
                                                                        InputBorder
                                                                            .none,
                                                                    focusedBorder:
                                                                        InputBorder
                                                                            .none,
                                                                    enabledBorder:
                                                                        InputBorder
                                                                            .none),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 30,
                                                        ),
                                                        SizedBox(
                                                          height: 40,
                                                          width: 120,
                                                          child: ElevatedButton(
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10)),
                                                                backgroundColor:
                                                                    const Color(
                                                                        0xFFEC4969),
                                                              ),
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context,
                                                                    true);
                                                                // GoRouter.of(context).go("/home");
                                                              },
                                                              child:
                                                                  const Center(
                                                                child: Text(
                                                                  'Submit',
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          'GeneralSans',
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          18),
                                                                ),
                                                              )),
                                                        ),
                                                      ],
                                                    ))
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
                            )
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            top: 1,
                            left: 80,
                          ),
                          child: Text(
                            "Jayce Mico",
                            style: TextStyle(
                              color: Color(0xFF404042),
                              fontFamily: "GeneralSansRegular",
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10, right: 30),
                      child: SizedBox(
                        width: 310,
                        child: Divider(
                          thickness: 0.9,
                          color: CtrlColors.grey,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 30,
                      ),
                      child: Container(
                          padding: const EdgeInsets.all(12),
                          height: MediaQuery.of(context).size.height / 1.4,
                          width: double.infinity,
                          child: IndexedStack(
                            index: ref.watch(index.notifier).state,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const HomePage(),
                              const EditProfile(),
                              const NotifScreen(),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
