import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohafez_elwaheen_student/bloc/teacher_cubit/teacher_cubit.dart';
import 'package:mohafez_elwaheen_student/core/helpers/helper_functions.dart';
import 'package:mohafez_elwaheen_student/core/styls/colors.dart';
import 'package:mohafez_elwaheen_student/models/teacher.dart';

import '../../../../core/enums.dart';
import '../../../../core/helpers/api_constatns.dart';
import '../../../../core/widgets/chached_image_widget.dart';
import '../../../../core/widgets/list_empty.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../core/widgets/texts.dart';
import '../../../../models/usel_model.dart';
import '../../reader_screen/reader_screen/reader_screenA.dart';

class ReadersScreen extends StatefulWidget {
  final String type;
  const ReadersScreen({required this.type});

  @override
  State<ReadersScreen> createState() => _ReadersScreenState();
}

class _ReadersScreenState extends State<ReadersScreen> {
  @override
  void initState() {
    super.initState();
    print(widget.type.toString());

    TeacherCubit.get(context).getTeachers(gender: widget.type);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: InkWell(
            onTap: () => pop(context),

            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: const Text(
            'الرئيسية',
            style: TextStyle(
              fontSize: 28,
              color: Color(0xff433826),
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.right,
            softWrap: false,
          )),
      body: BlocBuilder<TeacherCubit, TeacherState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: state.getTeachersState == RequestState.loading
                ? const Center(
                    child: LoadingWidget(height: 55, color: Colors.green))
                : state.teachers.isEmpty
                    ? const ListEmptyWidget(
                        title: "لا يوجد قراء",
                        textColor: Colors.black,
                      )
                    : ListView.builder(
                        itemCount: state.teachers.length,
                        itemBuilder: (ctx, index) {
                          User teacher = state.teachers[index];
                          return Container(
                            height: 100,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.grey, width: .2))),
                            child: Row(
                              children: [
                                Container(
                                  height: 55,
                                  width: 55,
                                  decoration:  BoxDecoration(
                                    border: Border.all(color: Colors.grey,width: .8),
                                      shape: BoxShape.circle),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(25),
                                      child: CircleImageWidget(
                      height: 55, width: 55, image: ApiConstants.imageUrl(teacher.profileImage??"")),
                                )),
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                    child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:  [
                                    Text(
                                      teacher.fullName!,
                                      style:const TextStyle(
                                          fontSize: 28,
                                          color: Color(0xff433826),
                                          fontWeight: FontWeight.w700,
                                          height: .8),
                                      textAlign: TextAlign.right,
                                      softWrap: false,
                                    ),
                                    Text(
                                     teacher.country!,
                                      style:const TextStyle(
                                        height: .8,
                                        fontSize: 28,
                                        color: Color(0xffa7a7a7),
                                      ),
                                      textAlign: TextAlign.right,
                                      softWrap: false,
                                    )
                                  ],
                                )),
                                GestureDetector(
                                  onTap: () {
                                    pushPage(context,  ReaderScreen(teacher:teacher));
                                  },
                                  child: Container(
                                    height: 40,
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30),
                                    decoration: BoxDecoration(
                                      color: const Color(0x330d7f43),
                                      borderRadius: BorderRadius.circular(21.0),
                                    ),
                                    child: const Texts(
                                        title: "ابدأ",
                                        textColor: Colors.green,
                                        fontSize: 20,
                                        weight: FontWeight.bold,
                                        align: TextAlign.center),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
          );
        },
      ),
    );
  }
}
