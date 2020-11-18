import 'package:fitness_app/domain/workout.dart';
import 'package:flutter/material.dart';

class WorkoutsList extends StatelessWidget {
  final workouts = <Workout>[
    Workout(
        title: 'Test1 title',
        author: 'Max1',
        description: 'Test Workout',
        level: 'Beginner'),
    Workout(
        title: 'Test2 title',
        author: 'Max2',
        description: 'Test Workout',
        level: 'Advanced'),
    Workout(
        title: 'Test3 title',
        author: 'Max3',
        description: 'Test Workout',
        level: 'Intermediate'),
    Workout(
        title: 'Test4 title',
        author: 'Max4',
        description: 'Test Workout',
        level: 'Beginner'),
    Workout(
        title: 'Test5 title',
        author: 'Max5',
        description: 'Test Workout',
        level: 'Beginner')
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
                    decoration:
                        BoxDecoration(color: Color.fromRGBO(50, 65, 85, 0.9)),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      leading: Container(
                        padding: EdgeInsets.only(right: 12),
                        child: Icon(Icons.fitness_center,
                            color: Theme.of(context).textTheme.title.color),
                        decoration: BoxDecoration(
                            border: Border(
                                right: BorderSide(
                                    width: 2, color: Colors.white24))),
                      ),
                      title: Text(workouts[i].title,
                          style: TextStyle(
                              color: Theme.of(context).textTheme.title.color,
                              fontWeight: FontWeight.bold)),
                      trailing: Icon(Icons.arrow_right,
                          color: Theme.of(context).textTheme.title.color),
                      subtitle: subtitle(context, workouts[i]),
                    ),
                  ),
                );
              })),
    );
  }
}

Widget subtitle(BuildContext context, Workout workout) {
  var color = Colors.grey;
  double indicatorLevel = 0;

  switch (workout.level) {
    case 'Beginner':
      color = Colors.green;
      indicatorLevel = 0.33;
      break;
    case 'Intermediate':
      color = Colors.yellow;
      indicatorLevel = 0.66;
      break;
    case 'Advanced':
      color = Colors.red;
      indicatorLevel = 1;
      break;
  }

  return Row(
    children: <Widget>[
      Expanded(
          flex: 1,
          child: LinearProgressIndicator(
            backgroundColor: Theme.of(context).focusColor,
            value: indicatorLevel,
            valueColor: AlwaysStoppedAnimation(color),
          )),
      SizedBox(width: 10),
      Expanded(
          flex: 3,
          child: Text(
            workout.level,
            style: TextStyle(color: Theme.of(context).textTheme.title.color),
          ))
    ],
  );
}
