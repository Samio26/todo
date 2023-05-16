import 'package:equatable/equatable.dart';

class CategoryState extends Equatable{
final bool btnPersonal;
final bool btnWork;

const CategoryState(
  {
    this.btnPersonal=false,
    this.btnWork=false,
  }
);

CategoryState copyWith({
  bool? btnPersonal,
  bool? btnWork
}){
  return CategoryState(
    btnPersonal: btnPersonal??this.btnPersonal,
    btnWork: btnWork??this.btnWork
  );
}
  @override
  List<Object?> get props => [btnPersonal,btnWork];

}