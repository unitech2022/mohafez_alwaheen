import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohafez_elwaheen_student/bloc/table_cubit/table_cubit.dart';
import 'package:mohafez_elwaheen_student/core/enums.dart';
import 'package:mohafez_elwaheen_student/core/helpers/helper_functions.dart';
import 'package:mohafez_elwaheen_student/models/teacher.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';

import '../../../../core/helpers/api_constatns.dart';
import '../../../../core/widgets/chached_image_widget.dart';
import '../../../../core/widgets/list_empty.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../core/widgets/texts.dart';
import '../../../../models/table.dart';
import '../../../../models/usel_model.dart';

class ReaderScreen extends StatefulWidget {
  final User teacher;
  const ReaderScreen({super.key, required this.teacher});

  @override
  State<ReaderScreen> createState() => _ReaderScreenState();
}

class _ReaderScreenState extends State<ReaderScreen> {
  @override
  void initState() {
    super.initState();
    TableCubit.get(context).getTables(teacherId: widget.teacher.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: InkWell(
            onTap: () {
              pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: const Text(
            'إقرأ',
            style: TextStyle(
              fontSize: 28,
              color: Color(0xff433826),
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.right,
            softWrap: false,
          )),
      body: BlocBuilder<TableCubit, TableState>(
        builder: (context, state) {
          return SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        height: 100,
                        width: 100,
                        decoration:  BoxDecoration(
                        border:  Border.all(color: Colors.grey,width: .8),
                          shape: BoxShape.circle),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: CircleImageWidget(
                              height: 100,
                              width: 100,
                              image: ApiConstants.imageUrl(
                                  widget.teacher.profileImage??"")),
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      widget.teacher.fullName!,
                      style: const TextStyle(
                          fontSize: 34,
                          color: Color(0xff433826),
                          fontWeight: FontWeight.w700,
                          height: .8),
                      textAlign: TextAlign.right,
                      softWrap: false,
                    ),
                    Text(
                      widget.teacher.country!,
                      style: const TextStyle(
                        height: .8,
                        fontSize: 34,
                        color: Color(0xffa7a7a7),
                      ),
                      textAlign: TextAlign.right,
                      softWrap: false,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    state.getTablesState == RequestState.loading
                        ? const Padding(
                            padding: EdgeInsets.only(top: 50),
                            child:
                                LoadingWidget(height: 55, color: Colors.green))
                        : state.tables.isEmpty
                            ? Padding(
                              padding: const EdgeInsets.only(top: 90),
                              child: const ListEmptyWidget(
                                  title: "لا يوجد مواعيد في الوقت الحالي ",
                                  textColor: Colors.black,
                                ),
                            )
                            : ListView.builder(
                                itemCount: state.tables.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (ctx, index) {
                                  TableModel table = state.tables[index];

                                  return Container(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 15, bottom: 25),
                                      decoration: const BoxDecoration(),
                                      child: Column(
                                        children: [
                                          Text(
                                            table.today!,
                                            style: const TextStyle(
                                              fontSize: 30,
                                              color: const Color(0xff433826),
                                              fontWeight: FontWeight.w700,
                                            ),
                                            textAlign: TextAlign.center,
                                            softWrap: false,
                                          ),
                                          Text(
                                            table.dateToday!.split("T")[0],
                                            style: const TextStyle(
                                              fontFamily: 'Traditional Arabic',
                                              fontSize: 26,
                                              color: const Color(0xff433826),
                                            ),
                                            textAlign: TextAlign.center,
                                            softWrap: false,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "من  ${table.fromHours}",
                                                style: const TextStyle(
                                                  fontFamily:
                                                      'Traditional Arabic',
                                                  fontSize: 20,
                                                  color: Color(0xffa7a7a7),
                                                ),
                                                textAlign: TextAlign.center,
                                                softWrap: false,
                                              ),
                                              sizedWidth(15),
                                              Text(
                                                "حتي  ${table.toHours}",
                                                style: const TextStyle(
                                                  fontFamily:
                                                      'Traditional Arabic',
                                                  fontSize: 20,
                                                  color:
                                                      const Color(0xffa7a7a7),
                                                ),
                                                textAlign: TextAlign.center,
                                                softWrap: false,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              if (table.status == 0) {
                                                showDialogWidget(context,table.link!);
                                              } else {
                                                showTopMessage(
                                                    context: context,
                                                    customBar: const CustomSnackBar
                                                            .error(
                                                        backgroundColor:
                                                            Colors.orange,
                                                        message:
                                                            "الرابط غير متاح ",
                                                        textStyle: TextStyle(
                                                            fontFamily: "font",
                                                            fontSize: 16,
                                                            color:
                                                                Colors.white)));
                                              }
                                            },
                                            child: Container(
                                              height: 40,
                                              width: 220,
                                              alignment: Alignment.center,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 30),
                                              decoration: BoxDecoration(
                                                color: table.status == 0
                                                    ? const Color(0x330d7f43)
                                                    : const Color.fromARGB(
                                                        255, 199, 198, 198),
                                                borderRadius:
                                                    BorderRadius.circular(21.0),
                                              ),
                                              child: Texts(
                                                  title: "دخول",
                                                  textColor: table.status == 0
                                                      ? Colors.green
                                                      : Colors.black,
                                                  fontSize: 20,
                                                  weight: FontWeight.bold,
                                                  align: TextAlign.center),
                                            ),
                                          ),
                                        ],
                                      ));
                                }),
                  ]),
            ),
          );
        },
      ),
    );
  }

  void showDialogWidget(BuildContext context,String link) {
   
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          insetPadding: const EdgeInsets.all(18),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          // contentPadding: EdgeInsets.only(top: 10.0),
          // title: const Text('AlertDialog Title'),
          content: StatefulBuilder(builder: (BuildContext context,
              void Function(void Function()) setStateDialog) {
            return Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "عزيزي الطالب",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const Text(
                        "سوف يتم تحويلك لمتجر التطبيقات لتحميل برنامج الفيديو لتتمكن من  التواصل مع الشيخ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            height: 1.2,
                            fontSize: 28,
                            fontWeight: FontWeight.normal,
                            color: Colors.black)),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        pop(context);
                        launchUrlFunction("https://play.google.com/store/search?q=zoom&c=apps");
                      },
                      child: Container(
                        height: 50,
                        width: 200,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xffe0ddd6),
                          borderRadius: BorderRadius.circular(21.0),
                        ),
                        child: const Texts(
                            title: "تحميل التطبيق ",
                            textColor: Colors.black,
                            fontSize: 20,
                            weight: FontWeight.bold,
                            align: TextAlign.center),
                      ),
                    ),
                      const SizedBox(
                      height: 10,
                    ),
                     GestureDetector(
                      onTap: () {
                        pop(context);
                        launchUrlFunction(link);
                      },
                      child: Container(
                        height: 50,
                        width: 200,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xffe0ddd6),
                          borderRadius: BorderRadius.circular(21.0),
                        ),
                        child: const Texts(
                            title: "دخول",
                            textColor: Colors.black,
                            fontSize: 20,
                            weight: FontWeight.bold,
                            align: TextAlign.center),
                      ),
                    ),
                
                  ],
                ));
          }),
        );
      },
    );
  }
}
