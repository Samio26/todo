import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:todo/di/injection.dart' as di;
import 'package:todo/feature_tasks/ui/bloc/home_bloc_bloc.dart';
import 'package:todo/navigation/routes.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>di.getIt<HomeBlocBloc>()..add(GetAllTasksEvent()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: onBoardingRoute,
        routes: routes,
      ),
    );
  }
}
