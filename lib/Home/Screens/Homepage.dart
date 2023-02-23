// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:readmore/readmore.dart';
import 'package:rpcstudentapp/Class/notif.dart';
import 'package:rpcstudentapp/Constants/Constants.dart';
import 'package:rpcstudentapp/Controller/homepageController.dart';
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
    super.initState();
    tz.initializeTimeZones();
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(homepagecontroller);
    return StreamBuilder<dynamic>(
        stream: controller.supabase.from("monitoring_sheet").stream(
            primaryKey: ['id']).eq("z_code", controller.code.toString()),
        builder: (context, snapshot) {
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
                      padding:
                          const EdgeInsets.only(left: 20, top: 15, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Text(
                                "Advisor:",
                                style: TextStyle(
                                  color: Color(0xFF404042),
                                  fontFamily: "GeneralSansRegular",
                                  fontSize: 10,
                                ),
                              ),
                              const Text(
                                "Jayce Mico",
                                style: TextStyle(
                                  color: CtrlColors.red,
                                  fontFamily: "GeneralSans",
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                    padding: const EdgeInsets.only(top: 2.5),
                                    child: Text(
                                      snapshot.hasData == true
                                          ? snapshot.data[0]['status']
                                          : "",
                                      style: TextStyle(
                                        color: snapshot.hasData == true
                                            ? snapshot.data[0]['status'] ==
                                                    "APPROVED"
                                                ? CtrlColors.green
                                                : Colors.brown
                                            : Colors.black,
                                        fontFamily: "GeneralSans",
                                        fontSize: 8,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                snapshot.hasData == true
                                    ? snapshot.data[0]['approve_title'] == true
                                        ? "Outline Proposal"
                                        : snapshot.data[0]
                                                    ['outline_proposal'] ==
                                                true
                                            ? "Outline Defense"
                                            : snapshot.data[0]
                                                        ['outline_defense'] ==
                                                    true
                                                ? "Data Gathering"
                                                : snapshot.data[0]['data_gathering'] ==
                                                        true
                                                    ? "Manuscript for Oral Presentation"
                                                    : snapshot.data[0][
                                                                'manuscript'] ==
                                                            true
                                                        ? "Final Oral Presentation"
                                                        : snapshot.data[0][
                                                                    'final_oral_prep'] ==
                                                                true
                                                            ? "Routing"
                                                            : snapshot.data[0][
                                                                        'routing'] ==
                                                                    true
                                                                ? "Plagiarism Check"
                                                                : snapshot.data[0]['plagiarism'] ==
                                                                        true
                                                                    ? "Approval"
                                                                    : snapshot.data[0]['approval'] ==
                                                                            true
                                                                        ? "Submission of Approved Final Output(Book Form)"
                                                                        : snapshot.data[0]['final_output'] == true
                                                                            ? "COMPLETE"
                                                                            : snapshot.data[0]['subject_teacher'] == true
                                                                                ? "Approval of Title"
                                                                                : snapshot.data[0]['research_coordinator'] == true
                                                                                    ? "Approval of Title"
                                                                                    : ""
                                    : "Approval of Title",
                                style: TextStyle(
                                  color: CtrlColors.red,
                                  fontFamily: "GeneralSans",
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            "Next to do: ",
                            style: TextStyle(
                              color: Color(0xFF404042),
                              fontFamily: "GeneralSansRegular",
                              fontSize: 10,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 2.5),
                            child: Text(
                              "PENDING",
                              style: TextStyle(
                                color: CtrlColors.red,
                                fontFamily: "GeneralSans",
                                fontSize: 8,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        snapshot.hasData == true
                            ? snapshot.data[0]['approve_title'] == true
                                ? "Outline Defense"
                                : snapshot.data[0]['outline_proposal'] == true
                                    ? "Data Gathering"
                                    : snapshot.data[0]['outline_defense'] ==
                                            true
                                        ? "Manuscript for Oral Presentation"
                                        : snapshot.data[0]['data_gathering'] ==
                                                true
                                            ? "Final Oral Presentation"
                                            : snapshot.data[0]['manuscript'] ==
                                                    true
                                                ? "Routing"
                                                : snapshot.data[0][
                                                            'final_oral_prep'] ==
                                                        true
                                                    ? "Plagiarism Check"
                                                    : snapshot.data[0]
                                                                ['routing'] ==
                                                            true
                                                        ? "Approval"
                                                        : snapshot.data[0][
                                                                    'plagiarism'] ==
                                                                true
                                                            ? "Submission of Approved Final Output(Book Form)"
                                                            : snapshot.data[0][
                                                                        'approval'] ==
                                                                    true
                                                                ? "COMPLETE"
                                                                : snapshot.data[0]['final_output'] ==
                                                                        true
                                                                    ? "COMPLETE"
                                                                    : snapshot.data[0]['subject_teacher'] ==
                                                                            true
                                                                        ? "COMPLETE"
                                                                        : snapshot.data[0]['research_coordinator'] ==
                                                                                true
                                                                            ? "COMPLETE"
                                                                            : ""
                            : "Approval of Title",
                        style: TextStyle(
                          color: CtrlColors.red,
                          fontFamily: "GeneralSans",
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            "Afther That: ",
                            style: TextStyle(
                              color: Color(0xFF404042),
                              fontFamily: "GeneralSansRegular",
                              fontSize: 10,
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(top: 2.5),
                          //   child: Text(
                          //     "PENDING",
                          //     style: TextStyle(
                          //       color: CtrlColors.red,
                          //       fontFamily: "GeneralSans",
                          //       fontSize: 8,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        snapshot.hasData == true
                            ? snapshot.data[0]['approve_title'] == true
                                ? "Data Gathering"
                                : snapshot.data[0]['outline_proposal'] == true
                                    ? "Manuscript for Oral Presentation"
                                    : snapshot.data[0]['outline_defense'] ==
                                            true
                                        ? "Final Oral Presentation"
                                        : snapshot.data[0]['data_gathering'] ==
                                                true
                                            ? "Routing"
                                            : snapshot.data[0]['manuscript'] ==
                                                    true
                                                ? "Plagiarism Check"
                                                : snapshot.data[0][
                                                            'final_oral_prep'] ==
                                                        true
                                                    ? "Approval"
                                                    : snapshot.data[0]
                                                                ['routing'] ==
                                                            true
                                                        ? "Submission of Approved Final Output(Book Form)"
                                                        : snapshot.data[0][
                                                                    'plagiarism'] ==
                                                                true
                                                            ? "Complete"
                                                            : "Complete"
                            : "Approval of Title",
                        style: TextStyle(
                          color: CtrlColors.red,
                          fontFamily: "GeneralSans",
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 40),
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
                                borderRadius: BorderRadius.circular(10)),
                            backgroundColor: CtrlColors.black,
                          ),
                          onPressed: () {},
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
                                borderRadius: BorderRadius.circular(10)),
                            backgroundColor: CtrlColors.black,
                          ),
                          onPressed: () {
                            // NotificationServices()
                            //     .showNotification(1, "title", "body", 1);
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
                ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) {
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
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Text(
                                  'Jayce Mico Dignadice',
                                  style: TextStyle(
                                      fontFamily: 'GeneralSans',
                                      color: CtrlColors.red,
                                      fontSize: 10),
                                ),
                                Text(
                                  'Adviser',
                                  style: TextStyle(
                                      fontFamily: 'GeneralSansRegular',
                                      color: CtrlColors.black,
                                      fontSize: 10),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                SingleChildScrollView(
                                  child: ReadMoreText(
                                    'Sa inyung presentation about sa title defense is okay, gi check nako then I pa check ninyo ug balik sa akoa ang akoang gipa edit nako sa inyo after ni.',
                                    trimLines: 2,
                                    colorClickableText: CtrlColors.red,
                                    trimMode: TrimMode.Line,
                                    trimCollapsedText: '\n Read More',
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
                    }),
              ],
            ),
          ));
        });
  }
}
