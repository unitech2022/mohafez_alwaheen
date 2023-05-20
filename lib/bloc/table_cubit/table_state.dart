part of 'table_cubit.dart';


 class TableState extends Equatable {
  final RequestState getTablesState;
  final List<TableModel> tables;

  const TableState({ this.getTablesState = RequestState.loading, this.tables = const[]});



  @override
  List<Object> get props => [getTablesState,tables];
}