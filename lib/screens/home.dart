import 'package:fitness_app/components/workouts-list.dart';
import 'package:fitness_app/domain/workout.dart';
import 'package:fitness_app/services/auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: Text('MaxFit'),
          leading: Icon(Icons.fitness_center),
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () {
                AuthService().logOut();
              },
              icon: Icon(Icons.supervised_user_circle),
              color: Theme.of(context).primaryColor,
              label: SizedBox.shrink(),
            )
          ],
        ),
        body: WorkoutsList(),
      ),
    );
  }
}
