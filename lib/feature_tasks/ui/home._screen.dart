import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/feature_tasks/domain/model/task.dart';
import 'package:todo/feature_tasks/ui/bloc/home_bloc_bloc.dart';
import 'package:todo/feature_tasks/ui/widget/button_create_cancel.dart';
import 'package:todo/feature_tasks/ui/widget/card.dart';
import 'package:todo/feature_tasks/ui/widget/card_category.dart';
import 'package:todo/feature_tasks/ui/widget/drawer.dart';
import 'package:todo/feature_tasks/ui/widget/field_date.dart';
import 'package:todo/feature_tasks/ui/widget/task.dart';
import 'package:todo/helpers/functions.dart';
import 'package:todo/helpers/sackbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controllerTitle = TextEditingController();
    final TextEditingController dateController = TextEditingController();
    final TextEditingController timeController = TextEditingController();

    final TextEditingController descController = TextEditingController();
    return BlocListener<HomeBlocBloc, HomeState>(
      listener: (context, state) {
        print(state.getTasksState.listTasks);
        if (state.taskState.status == Status.success) {
          Navigator.of(context).pop();
          snackbar(context, "your task created successfully", Colors.green);
        } else if (state.taskState.status == Status.failure) {
          snackbar(context, "network failed", Colors.red);
        }
      },
      child: Scaffold(
        floatingActionButton: InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: BlocBuilder<HomeBlocBloc, HomeState>(
                    builder: (context, state) {
                      return SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            Text(
                              "Title task",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                                controller: controllerTitle,
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary)),
                                  hintText: "title task",
                                  hintStyle: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary),
                                  contentPadding: EdgeInsets.only(left: 5),
                                  filled: true,
                                  fillColor: Colors.grey.withOpacity(.1),
                                )),
                            const SizedBox(height: 10),
                            Text(
                              "Category",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    context.read<HomeBlocBloc>()
                                      ..add(SelectEvent(category: "Personal"));
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * .43,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: state.categoryState.btnPersonal
                                          ? Colors.greenAccent
                                          : Colors.grey.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Row(children: [
                                      Icon(Icons.person),
                                      Text("Personal")
                                    ]),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    context.read<HomeBlocBloc>()
                                      ..add(SelectEvent(category: "Work"));
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * .4,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: state.categoryState.btnWork
                                          ? Colors.greenAccent
                                          : Colors.grey.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Row(children: [
                                      Icon(Icons.category),
                                      Text("Work")
                                    ]),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "description",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextField(
                              controller: descController,
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.circular(20)),
                                  hintText: "Description",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent)),
                                  filled: true,
                                  fillColor: Colors.grey.withOpacity(0.2)),
                              maxLines: 6,
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Expanded(
                                    child: FieldDate(
                                        controller: dateController,
                                        hint: "dd/mm/yy")),
                                Expanded(
                                    child: FieldDate(
                                  controller: timeController,
                                  hint: "hh:mm",
                                ))
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ButtonTask(
                                    onPress: () {
                                      context.read<HomeBlocBloc>()
                                        ..add(CreateTaskEvent(
                                            task: Taskk(
                                                categ: state.categoryState
                                                        .btnPersonal
                                                    ? "Personal"
                                                    : "Work",
                                                date:
                                                    insertSlash(dateController.text.trim()), 
                                                desc:
                                                    descController.text.trim(),
                                                title: controllerTitle.text
                                                    .trim())));
                                                              context.read<HomeBlocBloc>()..add(GetAllTasksEvent());

                                    },
                                    colorbutton: Colors.greenAccent,
                                    label: "Create"),
                                ButtonTask(
                                    onPress: () {
                                      Navigator.of(context).pop();
                                    },
                                    colorbutton: Colors.white,
                                    label: 'Cancel')
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
          child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.greenAccent, shape: BoxShape.circle),
              child: Icon(Icons.add, color: Colors.white)),
        ),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Today',
                style: TextStyle(color: Colors.black, fontSize: 13),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                getCurrentDate(),
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
          actions: [
            Icon(
              Icons.search,
              color: Colors.black,
            ),
            Icon(
              Icons.notification_add,
              color: Colors.black,
            )
          ],
        ),
        drawer: DrawerWidget(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              CardView(),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Task Category",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  CardCategory(
                    icon: Icons.person,
                    categ: "Personel",
                  ),
                  CardCategory(
                    icon: Icons.category,
                    categ: "Work",
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Text(
                "Priority Task",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(height: 15),
              BlocBuilder<HomeBlocBloc, HomeState>(
                builder: (context, state) {
                  return state.getTasksState.status == Status.loading
                      ? Center(child: CircularProgressIndicator())
                      :state.getTasksState.status==Status.success? ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: state.getTasksState.listTasks.length,
                          itemBuilder: ((context, index) {
                            return Task(
                                task: state.getTasksState.listTasks[index]);
                          })):Text("No Data");
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
