import 'package:dartz/dartz.dart';
import 'package:todo/feature_tasks/domain/model/task.dart';

abstract class HomeRepository{
  Future<Either<String,Unit>> createTask(Taskk task );
  Future<Either<String,List<Taskk>>> getAllTasks();
}