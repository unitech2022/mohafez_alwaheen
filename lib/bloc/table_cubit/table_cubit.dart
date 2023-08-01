import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/enums.dart';
import '../../core/helpers/api_constatns.dart';
import '../../models/table.dart';
import 'package:http/http.dart' as http;
part 'table_state.dart';

class TableCubit extends Cubit<TableState> {
  TableCubit() : super(const TableState());
  static TableCubit get(context) => BlocProvider.of<TableCubit>(context);

  Future getTables({teacherId}) async {
    emit(const TableState(getTablesState: RequestState.loading));
    var request = http.MultipartRequest(
        'GET',
        Uri.parse(
            '${ApiConstants.baseUrl}/table/get-tables-user?teacherId=$teacherId'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {

      String jsonDataString = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonDataString);

      emit(TableState(
          getTablesState: RequestState.loaded,
          tables: List<TableModel>.from(
              (jsonData as List).map((e) => TableModel.fromJson(e)))));
    } else {
        emit(const TableState(getTablesState: RequestState.error));
    }
  }
}
