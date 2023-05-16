import '../../domain/model/task.dart';

class TaskDto{
  final String title;
  final String desc;
  final String date;
  final String categ;
  const TaskDto({
    required this.categ,
    required this.date,
    required this.desc,
    required this.title
  });

  factory TaskDto.fromJson(Map<String,dynamic> json)=>TaskDto(categ: json["category"]??"", date: json["date"]??"", desc: json["desc"]??"", title: json["title"]??"");

  Taskk toEntity()=>Taskk(categ: categ, date: date, desc: desc, title: title);
}