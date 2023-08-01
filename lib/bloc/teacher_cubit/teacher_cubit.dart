import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/enums.dart';
import '../../core/helpers/api_constatns.dart';
import '../../models/teacher.dart';
import '../../models/usel_model.dart';
part 'teacher_state.dart';

class TeacherCubit extends Cubit<TeacherState> {
  TeacherCubit() : super(const TeacherState());
  static TeacherCubit get(context) => BlocProvider.of<TeacherCubit>(context);

  getTeachers({gender}) async {
    emit(const TeacherState(getTeachersState: RequestState.loading));
    var request = http.MultipartRequest(
        'GET',
        Uri.parse(
            '${ApiConstants.baseUrl}/teacher/get-teachers-by-gender?gender=$gender'));

    http.StreamedResponse response = await request.send();
  
    if (response.statusCode == 200) {
      String jsonDataString = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonDataString);

      emit(TeacherState(
          getTeachersState: RequestState.loaded,
          teachers: List<User>.from(
              (jsonData as List).map((e) => User.fromJson(e)))));
    } else {
      emit(const TeacherState(getTeachersState: RequestState.loading));
    }
  }
}
