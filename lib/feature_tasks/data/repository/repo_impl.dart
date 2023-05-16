import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todo/feature_tasks/data/remote/task_datasource.dart';
import 'package:todo/feature_tasks/domain/model/task.dart';
import 'package:todo/feature_tasks/domain/repository/home_repository.dart';

class HomeRepoImpl extends HomeRepository{
  final TaskDataSource _dataSource;
  HomeRepoImpl(this._dataSource);
  @override
 Future<Either<String, Unit>> createTask(Taskk task)async {
    try{
      final result=await _dataSource.createTask(task);
      return Right(unit);
    }on FirebaseException catch(e){
      return Left(e.toString());
    }
  }
  
  @override
  Future<Either<String, List<Taskk>>> getAllTasks()async {
   try{
    final result= await _dataSource.getAllTasks();
    return Right(result.map((event) => event.toEntity()).toList());
   }on FirebaseException catch(e){
    return Left(e.toString());
   }
  }
  
}