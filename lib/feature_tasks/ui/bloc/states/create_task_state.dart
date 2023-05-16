import 'package:equatable/equatable.dart';
import 'package:todo/helpers/functions.dart';

class TaskState extends Equatable{
  final Status status;
  const TaskState({
    this.status=Status.idle
  });
  

  TaskState copyWith({
    Status? status
  }){
    return TaskState(
      status: status??this.status
    );
  }
  @override
  List<Object?> get props =>  [status];



}