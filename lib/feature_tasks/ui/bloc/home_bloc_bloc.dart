import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:todo/feature_tasks/domain/model/task.dart';
import 'package:todo/feature_tasks/domain/repository/home_repository.dart';
import 'package:todo/feature_tasks/ui/bloc/states/category_state.dart';
import 'package:todo/feature_tasks/ui/bloc/states/create_task_state.dart';
import 'package:todo/feature_tasks/ui/bloc/states/gettasks_state.dart';
import 'package:todo/helpers/functions.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBlocBloc extends Bloc<HomeBlocEvent, HomeState> {
  final HomeRepository _repo;
  HomeBlocBloc(this._repo) : super(HomeState()) {
    on<SelectEvent>(_onClick);
    on<CreateTaskEvent>(_creatTask);
    on<GetAllTasksEvent>(_getAllTasks);
  }

  void _onClick(SelectEvent event, Emitter<HomeState> emit) {
    if (event.category == "Personal" && !state.categoryState.btnPersonal) {
      emit(state.copyWith(
          categoryState: state.categoryState.copyWith(
              btnPersonal: !state.categoryState.btnPersonal, btnWork: false)));
    } else if (event.category == "Work" && !state.categoryState.btnWork) {
      emit(state.copyWith(
          categoryState: state.categoryState.copyWith(
              btnWork: !state.categoryState.btnWork, btnPersonal: false)));
    }
  }

 void _creatTask(CreateTaskEvent event, Emitter<HomeState> emit) async {
    final result = await _repo.createTask(event.task);
    result.fold(
        (l) => emit(state.copyWith(
            taskState: state.taskState.copyWith(status: Status.failure))),
        (r) => emit(state.copyWith(
            taskState: state.taskState.copyWith(status: Status.success))));
  }

  void _getAllTasks(
    GetAllTasksEvent event,
    Emitter<HomeState> emit,
  )async{
    emit(state.copyWith(
      getTasksState: state.getTasksState.copyWith(
        status: Status.loading
      )
    ));
    final result= await _repo.getAllTasks();
    result.fold((l) => emit(state.copyWith(
      getTasksState: state.getTasksState.copyWith(

      status:Status.failure)
    )), (r) {
      emit(state.copyWith(
        getTasksState: state.getTasksState.copyWith(
          status: Status.success,
          listTasks: r
        )
      ));
    });
  }
}
