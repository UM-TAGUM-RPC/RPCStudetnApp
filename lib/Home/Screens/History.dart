import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:rpcstudentapp/Constants/Constants.dart';
import 'package:rpcstudentapp/Controller/homepageController.dart';
import 'package:rpcstudentapp/Widgets/cardHistory.dart';

class History extends ConsumerStatefulWidget {
  const History({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HistoryState();
}

class _HistoryState extends ConsumerState<History> {
  @override
  void initState() {
    ref.read(homepagecontroller.notifier).getUser();
    ref.read(homepagecontroller.notifier).getCode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(homepagecontroller);
    return StreamBuilder(
        stream: controller.supabase.from("monitoring_sheet").stream(
            primaryKey: ['id']).eq("z_code", controller.code.toString()),
        builder: (context, snapshot) {
          if (snapshot.hasData == null &&
              snapshot.connectionState == ConnectionState.none) {}

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
                    const SizedBox(
                      width: 10,
                    ),
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
              padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
              child: SingleChildScrollView(
                child: SizedBox(
                  height: 700,
                  child: ListView.builder(
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
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
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        // ignore: prefer_const_literals_to_create_immutables
                                        children: [
                                          Row(
                                            // ignore: prefer_const_literals_to_create_immutables
                                            children: [
                                              const Text(
                                                "Monitoring Sheet Status: ",
                                                style: TextStyle(
                                                  color: Color(0xFF404042),
                                                  fontFamily:
                                                      "GeneralSansRegular",
                                                  fontSize: 10,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 2.5),
                                                child: Text(
                                                  snapshot.data![index]
                                                      ['status'],
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
                                              children: [
                                                Text(
                                                  controller
                                                      .statuses(
                                                        approve_title: snapshot
                                                                .data![index]
                                                            ['approve_title'],
                                                        outline_proposal: snapshot
                                                                .data![index][
                                                            'outline_proposal'],
                                                        outline_defense: snapshot
                                                                .data![index]
                                                            ['outline_defense'],
                                                        data_gather: snapshot
                                                                .data![index]
                                                            ['data_gathering'],
                                                        manuscript: snapshot
                                                                .data![index]
                                                            ['manuscript'],
                                                        final_oral_prep: snapshot
                                                                .data![index]
                                                            ['final_oral_prep'],
                                                        routing: snapshot
                                                                .data![index]
                                                            ['routing'],
                                                        plagiarism: snapshot
                                                                .data![index]
                                                            ['plagiarism'],
                                                        approval: snapshot
                                                                .data![index]
                                                            ['approval'],
                                                        final_output: snapshot
                                                                .data![index]
                                                            ['final_output'],
                                                        subject_teacher: snapshot
                                                                .data![index]
                                                            ['subject_teacher'],
                                                        research_coordinator:
                                                            snapshot.data![
                                                                    index][
                                                                'research_coordinator'],
                                                      )
                                                      .toString(),
                                                  style: const TextStyle(
                                                    color: CtrlColors.red,
                                                    fontFamily: "GeneralSans",
                                                    fontSize: 12,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
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
                            const SizedBox(
                              height: 10,
                            ),
                            HistoryCard(
                                // ignore: prefer_if_null_operators
                                date: snapshot.data![index]
                                            ['approve_title_date'] !=
                                        null
                                    ? snapshot.data![index]
                                        ['approve_title_date']
                                    : "Pending",
                                status: snapshot.data![index]['approve_title'],
                                statusname: "Approval of Title"),
                            const SizedBox(
                              height: 10,
                            ),
                            HistoryCard(
                                // ignore: prefer_if_null_operators
                                date: snapshot.data![index]
                                            ['outline_proposal_date'] !=
                                        null
                                    ? snapshot.data![index]
                                        ['outline_proposal_date']
                                    : "Pending",
                                status: snapshot.data![index]
                                    ['outline_proposal'],
                                statusname: "Outline Proposal"),
                            const SizedBox(
                              height: 10,
                            ),
                            HistoryCard(
                                // ignore: prefer_if_null_operators
                                date: snapshot.data![index]
                                            ['outline_defense_date'] !=
                                        null
                                    ? snapshot.data![index]
                                        ['outline_defense_date']
                                    : "Pending",
                                status: snapshot.data![index]
                                    ['outline_defense'],
                                statusname: "Outline Defense"),
                            const SizedBox(
                              height: 10,
                            ),
                            HistoryCard(
                                // ignore: prefer_if_null_operators
                                date: snapshot.data![index]
                                            ['data_gathering_date'] !=
                                        null
                                    ? snapshot.data![index]
                                        ['data_gathering_date']
                                    : "Pending",
                                status: snapshot.data![index]['data_gathering'],
                                statusname: "Data Gathering"),
                            const SizedBox(
                              height: 10,
                            ),
                            HistoryCard(
                                // ignore: prefer_if_null_operators
                                date: snapshot.data![index]
                                            ['manuscript_date'] !=
                                        null
                                    ? snapshot.data![index]['manuscript_date']
                                    : "Pending",
                                status: snapshot.data![index]['manuscript'],
                                statusname: "Manuscript"),
                            const SizedBox(
                              height: 10,
                            ),
                            HistoryCard(
                                // ignore: prefer_if_null_operators
                                date: snapshot.data![index]
                                            ['final_oral_prep_date'] !=
                                        null
                                    ? snapshot.data![index]
                                        ['final_oral_prep_date']
                                    : "Pending",
                                status: snapshot.data![index]
                                    ['final_oral_prep'],
                                statusname: "Final Oral Preparation"),
                            const SizedBox(
                              height: 10,
                            ),
                            HistoryCard(
                                // ignore: prefer_if_null_operators
                                date: snapshot.data![index]['routing_date'] !=
                                        null
                                    ? snapshot.data![index]['routing_date']
                                    : "Pending",
                                status: snapshot.data![index]['routing'],
                                statusname: "Routing"),
                            const SizedBox(
                              height: 10,
                            ),
                            HistoryCard(
                                // ignore: prefer_if_null_operators
                                date: snapshot.data![index]
                                            ['plagiarism_date'] !=
                                        null
                                    ? snapshot.data![index]['plagiarism_date']
                                    : "Pending",
                                status: snapshot.data![index]['plagiarism'],
                                statusname: "Plagiarism"),
                            const SizedBox(
                              height: 10,
                            ),
                            HistoryCard(
                                // ignore: prefer_if_null_operators
                                date: snapshot.data![index]['approval_date'] !=
                                        null
                                    ? snapshot.data![index]['approval_date']
                                    : "Pending",
                                status: snapshot.data![index]['approval'],
                                statusname: "Approval"),
                            const SizedBox(
                              height: 10,
                            ),
                            HistoryCard(
                                // ignore: prefer_if_null_operators
                                date: snapshot.data![index]
                                            ['final_output_date'] !=
                                        null
                                    ? snapshot.data![index]['final_output_date']
                                    : "Pending",
                                status: snapshot.data![index]['final_output'],
                                statusname: "Final Output"),
                            const SizedBox(
                              height: 10,
                            ),
                            HistoryCard(
                                // ignore: prefer_if_null_operators
                                date: snapshot.data![index]
                                            ['subject_teacher_date'] !=
                                        null
                                    ? snapshot.data![index]
                                        ['subject_teacher_date']
                                    : "Pending",
                                status: snapshot.data![index]
                                    ['subject_teacher'],
                                statusname: "Subject Teacher"),
                            const SizedBox(
                              height: 10,
                            ),
                            HistoryCard(
                                // ignore: prefer_if_null_operators
                                date: snapshot.data![index]
                                            ['ressearch_coordinator_date'] !=
                                        null
                                    ? snapshot.data![index]
                                        ['ressearch_coordinator_date']
                                    : "Pending",
                                status: snapshot.data![index]
                                    ['ressearch_coordinator'],
                                statusname: "Research Coordinator"),
                          ],
                        );
                      }),
                ),
              ),
            ),
          );
        });
  }
}
