import 'package:flutter/material.dart';
import 'domain/workout.dart';

void main() => runApp(MaxFitApp());

class MaxFitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Max Fitness',
        theme: ThemeData(
            primaryColor: Color.fromRGBO(50, 65, 85, 1),
            textTheme: TextTheme(title: TextStyle(color: Colors.white))),
        home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: Text('MaxFit'),
          leading: Icon(Icons.fitness_center),
        ),
        body: WorkoutsList(),
      ),
    );
  }
}

class WorkoutsList extends StatelessWidget {
  final workouts = <Workout>[
    Workout(
        title: 'Test1 title',
        author: 'Max1',
        description: 'Test Workout',
        level: 'advanced'),
    Workout(
        title: 'Test2 title',
        author: 'Max2',
        description: 'Test Workout',
        level: 'advanced'),
    Workout(
        title: 'Test3 title',
        author: 'Max3',
        description: 'Test Workout',
        level: 'advanced'),
    Workout(
        title: 'Test4 title',
        author: 'Max4',
        description: 'Test Workout',
        level: 'advanced'),
    Workout(
        title: 'Test5 title',
        author: 'Max5',
        description: 'Test Workout',
        level: 'advanced')
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
          child: ListView.builder(
              itemCount: workouts.length,
              itemBuilder: (context, i) {
                return Card(
                  elevation: 2.0,
                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Container(
                    child: ListTile(
                      title: Text(workouts[i].title),
                    ),
                  ),
                );
              })),
    );
  }
}
