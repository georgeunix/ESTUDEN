import 'dart:async';

import 'package:animated_infinite_scroll_pagination/animated_infinite_scroll_pagination.dart';
import 'package:get_it/get_it.dart';
import 'package:student_maintenance/dao/studentdao.dart';
import 'package:student_maintenance/database/database.dart';

import '../dao/model/student.dart';

class StudentViewModel with PaginationViewModel<Student> {
  final _controller = StreamController<PaginationState<List<Student>>>();
  final _appDatabase = GetIt.I.get<AppDatabase>();

  StudentDao get studentDao => _appDatabase.studentDao;

  List<Student> students = List.empty(growable: true);

  StudentViewModel(this.students);

  Stream<PaginationState<List<Student>>> get result async* {
    yield* _controller.stream;
  }

  @override
  bool areItemsTheSame(Student a, Student b) {
    // TODO: implement areItemsTheSame
    return a.id_persona == b.id_persona;
  }

  @override
  Future<void> fetchData(int page) async {
    // TODO: implement fetchData
    //_controller.add(const PaginationLoading());
    try {
      final offset = (10 * page) - 10;
      final cachedData = students.isEmpty || students == null
          ? await studentDao.findStudent(offset, 10)
          : students;
      students = List.empty();
      final total = await studentDao.totalStudent();
      if (cachedData.isNotEmpty == true) {
        _controller.add(PaginationSuccess(cachedData));
        setTotal(total!);
      }
    } catch (error) {
      _controller.add(const PaginationError());
    }
  }

  @override
  Stream<PaginationState<List<Student>>> streamSubscription() {
    // TODO: implement streamSubscription
    return result;
  }
}
