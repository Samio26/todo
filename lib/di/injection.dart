import 'package:get_it/get_it.dart';
import 'package:todo/feature_tasks/data/remote/task_datasource.dart';
import 'package:todo/feature_tasks/data/repository/repo_impl.dart';
import 'package:todo/feature_tasks/domain/repository/home_repository.dart';
import 'package:todo/feature_tasks/ui/bloc/home_bloc_bloc.dart';


final getIt = GetIt.instance;

Future<void> init()async{
  //BLOC
  getIt.registerFactory(() => HomeBlocBloc(getIt()));

  //Repository
  getIt.registerLazySingleton<HomeRepository>(() => HomeRepoImpl(getIt()));

  //DataSource
  getIt.registerLazySingleton(() => TaskDataSource());
}