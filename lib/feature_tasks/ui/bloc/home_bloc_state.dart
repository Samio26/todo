part of 'home_bloc_bloc.dart';


class HomeState extends Equatable {
final CategoryState categoryState;
final TaskState taskState;
final GetTasksState getTasksState;
const HomeState({
  this.taskState=const TaskState(),
  this.categoryState= const CategoryState(),
  this.getTasksState=const GetTasksState()
});

HomeState copyWith({
  GetTasksState? getTasksState,
CategoryState? categoryState,
TaskState? taskState
}){
  return HomeState(
    getTasksState: getTasksState??this.getTasksState,
    categoryState: categoryState??this.categoryState,
    taskState: taskState??this.taskState,
  );
}
  @override
  List<Object?> get props => [categoryState,taskState,getTasksState];
}
