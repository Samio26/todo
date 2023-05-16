import 'package:equatable/equatable.dart';
import 'package:todo/helpers/functions.dart';

import '../../../domain/model/task.dart';

class GetTasksState extends Equatable{
  final Status status;
  final List<Taskk> listTasks;

  const GetTasksState({
    this.status=Status.idle,
    this.listTasks=const []
  });

  GetTasksState copyWith({
    Status? status,
    List<Taskk>? listTasks,
  }){
    return GetTasksState(
      status: status??this.status,
      listTasks: listTasks??this.listTasks
    );
  }


  @override
  List<Object?> get props => [status,listTasks];
}