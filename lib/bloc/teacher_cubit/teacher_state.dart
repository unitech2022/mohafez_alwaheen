part of 'teacher_cubit.dart';

 class TeacherState extends Equatable {
  final RequestState getTeachersState;
  final List<Teacher> teachers;

  const TeacherState({ this.getTeachersState = RequestState.loading, this.teachers = const[]});



  @override
  List<Object> get props => [getTeachersState,teachers];
}


