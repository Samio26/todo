part of 'home_bloc_bloc.dart';

abstract class HomeBlocEvent {}


class SelectEvent extends HomeBlocEvent {
  final String category;
   SelectEvent({
    required this.category
  });
}

class CreateTaskEvent extends HomeBlocEvent{
  final Taskk task;
   CreateTaskEvent({
    required this.task
  });
}


class GetAllTasksEvent extends HomeBlocEvent{}