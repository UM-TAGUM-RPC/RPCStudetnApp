// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:readmore/readmore.dart';
import 'package:rpcstudentapp/Class/notif.dart';
import 'package:rpcstudentapp/Constants/Constants.dart';
import 'package:rpcstudentapp/Constants/generateSheet.dart';
import 'package:rpcstudentapp/Controller/editprofileController.dart';
import 'package:rpcstudentapp/Controller/homepageController.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    ref.read(homepagecontroller.notifier).getUser();
    ref.read(homepagecontroller.notifier).getCode();
    requestPermission();
    super.initState();
    requestPermission();
    tz.initializeTimeZones();
  }

  Future<void> requestPermission() async {
    Permission? permission;
    await permission!.request();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final controller = ref.watch(homepagecontroller);
    return StreamBuilder(
        stream: controller.supabase.from("monitoring_sheet").stream(
            primaryKey: ['id']).eq("z_code", controller.code.toString()),
        builder: (context, snapshot) {
          // ignore: prefer_is_empty
          if (snapshot.data?.length == 0) {
            print(controller.userID);
            return Center(
                child: Card(
              shape: RoundedRectangleBorder(
                  side:
                      BorderSide(style: BorderStyle.solid, color: Colors.white),
                  borderRadius: BorderRadius.circular(20)),
              elevation: 5.0,
              color: Colors.white,
              child: Container(
                padding: const EdgeInsets.all(5),
                height: 300.h,
                width: 300.w,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 50, top: 40),
                        child: Text(
                          'Enter Code: ',
                          style: TextStyle(
                              fontFamily: 'GeneralSans',
                              fontSize: 15.sp,
                              color: CtrlColors.black),
                        ),
                      ),
                      10.verticalSpace,
                      Container(
                        width: 210.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextFormField(
                          controller: controller.zcode,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            filled: true,
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            floatingLabelStyle:
                                const TextStyle(color: CtrlColors.red),
                            labelText: "Code",
                            labelStyle: TextStyle(
                                fontFamily: "GeneralSans",
                                fontSize: 12.sp,
                                color: Color(0xFF404042)),
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: SvgPicture.asset(
                                CtrlSvg.giftCode,
                                height: 18.h,
                                width: 18.w,
                              ),
                            ),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      15.verticalSpace,
                      SizedBox(
                        width: 130,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              backgroundColor: const Color(0xFFEC4969),
                            ),
                            onPressed: () async {
                              final prefs =
                                  await SharedPreferences.getInstance();
                              if (controller.zcode.text.isNotEmpty) {
                                prefs.setString("code", controller.zcode.text);
                                // ignore: use_build_context_synchronously
                                GoRouter.of(context).push("/homepage");
                              }
                            },
                            child: Center(
                              child: Text(
                                'Submit Code',
                                style: TextStyle(
                                    fontFamily: 'GeneralSans',
                                    color: Colors.white,
                                    fontSize: 15.sp),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ));
          } else {
            return RefreshIndicator(
              onRefresh: () async {
                GoRouter.of(context).push("/homepage");
              },
              child: ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 28, right: 28),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 70,
                          child: Card(
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, top: 15, right: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      StreamBuilder<dynamic>(
                                          stream: controller.supabase
                                              .from("users")
                                              .stream(primaryKey: ['id']).eq(
                                                  "supabase_id",
                                                  snapshot.data![0]
                                                          ['id_adivsor']
                                                      ['advisor_id']),
                                          builder: (context, es) {
                                            if (es.hasData == null &&
                                                es.connectionState ==
                                                    ConnectionState.none) {}
                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              // ignore: prefer_const_literals_to_create_immutables
                                              children: [
                                                const Text(
                                                  "Advisor:",
                                                  style: TextStyle(
                                                    color: Color(0xFF404042),
                                                    fontFamily:
                                                        "GeneralSansRegular",
                                                    fontSize: 10,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 100,
                                                  height: 30,
                                                  child: ListView.builder(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemCount:
                                                          es.data?.length ?? 0,
                                                      itemBuilder:
                                                          (context, i) {
                                                        return Text(
                                                          "${es.data[i]['firstName']} ${es.data[i]['lastName']}",
                                                          style:
                                                              const TextStyle(
                                                            color:
                                                                CtrlColors.red,
                                                            fontFamily:
                                                                "GeneralSans",
                                                            fontSize: 12,
                                                          ),
                                                        );
                                                      }),
                                                )
                                              ],
                                            );
                                          }),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      Row(
                                        // ignore: prefer_const_literals_to_create_immutables
                                        children: [
                                          Text(
                                            "Monitoring Sheet Status: ",
                                            style: TextStyle(
                                              color: Color(0xFF404042),
                                              fontFamily: "GeneralSansRegular",
                                              fontSize: 10,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 2.5),
                                            child: Text(
                                              snapshot.data![index]['status'],
                                              style: TextStyle(
                                                color: snapshot.data![index]
                                                            ['status'] ==
                                                        "APPROVED"
                                                    ? CtrlColors.green
                                                    : Colors.brown,
                                                fontFamily: "GeneralSans",
                                                fontSize: 8,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 30,
                                        width: 150,
                                        child: ListView(
                                          shrinkWrap: true,
                                          children: [
                                            Text(
                                              controller
                                                  .statuses(
                                                    approve_title:
                                                        snapshot.data![index]
                                                            ['approve_title'],
                                                    outline_proposal: snapshot
                                                            .data![index]
                                                        ['outline_proposal'],
                                                    outline_defense:
                                                        snapshot.data![index]
                                                            ['outline_defense'],
                                                    data_gather:
                                                        snapshot.data![index]
                                                            ['data_gathering'],
                                                    manuscript:
                                                        snapshot.data![index]
                                                            ['manuscript'],
                                                    final_oral_prep:
                                                        snapshot.data![index]
                                                            ['final_oral_prep'],
                                                    routing:
                                                        snapshot.data![index]
                                                            ['routing'],
                                                    plagiarism:
                                                        snapshot.data![index]
                                                            ['plagiarism'],
                                                    approval:
                                                        snapshot.data![index]
                                                            ['approval'],
                                                    final_output:
                                                        snapshot.data![index]
                                                            ['final_output'],
                                                    subject_teacher:
                                                        snapshot.data![index]
                                                            ['subject_teacher'],
                                                    research_coordinator: snapshot
                                                            .data![index][
                                                        'research_coordinator'],
                                                  )
                                                  .toString(),
                                              style: TextStyle(
                                                color: CtrlColors.red,
                                                fontFamily: "GeneralSans",
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: SizedBox(
                            width: double.infinity,
                            child: Divider(
                              thickness: 1.0,
                              color: CtrlColors.grey,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 40,
                              width: 153,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    backgroundColor: CtrlColors.black,
                                  ),
                                  onPressed: () {
                                    controller.requestToApprove(
                                      context: context,
                                      advisor_id: snapshot.data![0]
                                          ['id_adivsor']['advisor_id'],
                                      approve_title: snapshot.data![index]
                                          ['approve_title'],
                                      outline_proposal: snapshot.data![index]
                                          ['outline_proposal'],
                                      outline_defense: snapshot.data![index]
                                          ['outline_defense'],
                                      data_gather: snapshot.data![index]
                                          ['data_gathering'],
                                      manuscript: snapshot.data![index]
                                          ['manuscript'],
                                      final_oral_prep: snapshot.data![index]
                                          ['final_oral_prep'],
                                      routing: snapshot.data![index]['routing'],
                                      plagiarism: snapshot.data![index]
                                          ['plagiarism'],
                                      approval: snapshot.data![index]
                                          ['approval'],
                                      final_output: snapshot.data![index]
                                          ['final_output'],
                                      subject_teacher: snapshot.data![index]
                                          ['subject_teacher'],
                                      research_coordinator: snapshot
                                          .data![index]['research_coordinator'],
                                    );
                                  },
                                  child: const Center(
                                    child: Text(
                                      'Requesting to Approve',
                                      style: TextStyle(
                                          fontFamily: 'GeneralSans',
                                          color: Colors.white,
                                          fontSize: 10),
                                    ),
                                  )),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              height: 40,
                              width: 103,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    backgroundColor: CtrlColors.black,
                                  ),
                                  onPressed: () async {
                                    String approvetitle = snapshot.data![index]
                                                ['approve_title_date'] ==
                                            null
                                        ? " "
                                        : DateFormat("yyyy-MM-dd").format(
                                            DateTime.parse(snapshot.data![index]
                                                ['approve_title_date']));
                                    String outlineproposal = snapshot
                                                    .data![index]
                                                ['outline_proposal_date'] ==
                                            null
                                        ? " "
                                        : DateFormat("yyyy-MM-dd")
                                            .format(DateTime.parse(
                                                snapshot.data![index]
                                                    ['outline_proposal_date']))
                                            .toString();
                                    String outlinedefense = snapshot
                                                    .data![index]
                                                ['outline_defense_date'] ==
                                            null
                                        ? " "
                                        : DateFormat("yyyy-MM-dd")
                                            .format(DateTime.parse(
                                                snapshot.data![index]
                                                    ['outline_defense_date']))
                                            .toString();
                                    String datagather = snapshot.data![index]
                                                ['data_gathering_date'] ==
                                            null
                                        ? " "
                                        : DateFormat("yyyy-MM-dd")
                                            .format(DateTime.parse(
                                                snapshot.data![index]
                                                    ['data_gathering_date']))
                                            .toString();
                                    String manuscript = snapshot.data![index]
                                                ['manuscript_date'] ==
                                            null
                                        ? " "
                                        : DateFormat("yyyy-MM-dd")
                                            .format(DateTime.parse(
                                                snapshot.data![index]
                                                    ['manuscript_date']))
                                            .toString();
                                    String finaloralprep = snapshot.data![index]
                                                ['final_oral_prep_date'] ==
                                            null
                                        ? " "
                                        : DateFormat("yyyy-MM-dd")
                                            .format(DateTime.parse(
                                                snapshot.data![index]
                                                    ['final_oral_prep_date']))
                                            .toString();
                                    String routing = snapshot.data![index]
                                                ['routing_date'] ==
                                            null
                                        ? "  "
                                        : DateFormat("yyyy-MM-dd")
                                            .format(DateTime.parse(snapshot
                                                .data![index]['routing_date']))
                                            .toString();
                                    String plagia = snapshot.data![index]
                                                ['plagiarism_date'] ==
                                            null
                                        ? " "
                                        : DateFormat("yyyy-MM-dd")
                                            .format(DateTime.parse(
                                                snapshot.data![index]
                                                    ['plagiarism_date']))
                                            .toString();
                                    String approval = snapshot.data![index]
                                                ['approval_date'] ==
                                            null
                                        ? ""
                                        : DateFormat("yyyy-MM-dd")
                                            .format(DateTime.parse(snapshot
                                                .data![index]['approval_date']))
                                            .toString();
                                    String finaloutput = snapshot.data![index]
                                                ['final_output_date'] ==
                                            null
                                        ? " "
                                        : DateFormat("yyyy-MM-dd")
                                            .format(DateTime.parse(
                                                snapshot.data![index]
                                                    ['final_output_date']))
                                            .toString();

                                    controller.downloadFile(
                                      context: context,
                                      approve_title: approvetitle,
                                      outline_proposal: outlineproposal,
                                      outline_defense: outlinedefense,
                                      data_gather: datagather,
                                      manuscript: manuscript,
                                      final_oral_prep: finaloralprep,
                                      routing: routing,
                                      plagiarism: plagia,
                                      approval: approval,
                                      final_output: finaloutput,
                                      advisor_id: snapshot.data![0]
                                          ['id_adivsor']['advisor_id'],
                                    );
                                  },
                                  child: const Center(
                                    child: Text(
                                      'Download File',
                                      style: TextStyle(
                                          fontFamily: 'GeneralSans',
                                          color: Colors.white,
                                          fontSize: 10),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            'Please take note the comment section can be considered to put revisions by the',
                            style: TextStyle(
                                fontFamily: 'GeneralSansRegular',
                                color: Colors.grey,
                                fontSize: 8),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                'Advisor:',
                                style: TextStyle(
                                    fontFamily: 'GeneralSansRegular',
                                    color: Colors.grey,
                                    fontSize: 10),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                  'Comments',
                                  style: TextStyle(
                                      fontFamily: 'GeneralSans',
                                      color: CtrlColors.red,
                                      fontSize: 10),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: SizedBox(
                            width: double.infinity,
                            child: Divider(
                              thickness: 1.0,
                              color: CtrlColors.grey,
                            ),
                          ),
                        ),
                        StreamBuilder<dynamic>(
                            stream: controller.supabase
                                .from("advisor_comments")
                                .stream(primaryKey: ['id']).eq(
                                    "monitor_id", snapshot.data![index]['id']),
                            builder: (context, eh) {
                              if (eh.hasData == null &&
                                  eh.connectionState == ConnectionState.none) {}
                              return ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: eh.data?.length ?? 0,
                                  itemBuilder: (context, ind) {
                                    return Column(
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          padding: EdgeInsets.all(10),
                                          constraints: BoxConstraints(
                                            maxHeight: double.infinity,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Color(0XFFF7F7F7),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            // ignore: prefer_const_literals_to_create_immutables
                                            children: [
                                              StreamBuilder<dynamic>(
                                                  stream: controller.supabase
                                                      .from("users")
                                                      .stream(primaryKey: [
                                                    'id'
                                                  ]).eq(
                                                          "supabase_id",
                                                          snapshot.data![0]
                                                                  ['id_adivsor']
                                                              ['advisor_id']),
                                                  builder: (context, es) {
                                                    if (es.hasData == null &&
                                                        es.connectionState ==
                                                            ConnectionState
                                                                .none) {}
                                                    return Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      // ignore: prefer_const_literals_to_create_immutables
                                                      children: [
                                                        SizedBox(
                                                          width: 100,
                                                          height: 15,
                                                          child:
                                                              ListView.builder(
                                                                  scrollDirection:
                                                                      Axis
                                                                          .horizontal,
                                                                  itemCount: es
                                                                          .data
                                                                          ?.length ??
                                                                      0,
                                                                  itemBuilder:
                                                                      (context,
                                                                          i) {
                                                                    return Text(
                                                                      "${es.data[i]['firstName']} ${es.data[i]['lastName']}",
                                                                      style:
                                                                          const TextStyle(
                                                                        color: CtrlColors
                                                                            .red,
                                                                        fontFamily:
                                                                            "GeneralSans",
                                                                        fontSize:
                                                                            12,
                                                                      ),
                                                                    );
                                                                  }),
                                                        ),
                                                        const Text(
                                                          "Advisor:",
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF404042),
                                                            fontFamily:
                                                                "GeneralSansRegular",
                                                            fontSize: 10,
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  }),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              SingleChildScrollView(
                                                child: ReadMoreText(
                                                  eh.data![ind]['comments'],
                                                  trimLines: 2,
                                                  colorClickableText:
                                                      CtrlColors.red,
                                                  trimMode: TrimMode.Line,
                                                  trimCollapsedText:
                                                      '\n Read More',
                                                  trimExpandedText: 'Read Less',
                                                  lessStyle: TextStyle(
                                                      fontFamily: 'GeneralSans',
                                                      fontSize: 14,
                                                      color: CtrlColors.red),
                                                  moreStyle: TextStyle(
                                                      fontFamily: 'GeneralSans',
                                                      fontSize: 14,
                                                      color: CtrlColors.red),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        )
                                      ],
                                    );
                                  });
                            })
                      ],
                    ),
                  ));
                },
              ),
            );
          }
        });
  }
}
