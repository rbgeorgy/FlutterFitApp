import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fitness_app/components/active-workouts.dart';
import 'package:fitness_app/components/workouts-list.dart';
import 'package:fitness_app/domain/workout.dart';
import 'package:fitness_app/services/auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int sectionIndex = 0;
  @override
  Widget build(BuildContext context) {
    var navigationBar = CurvedNavigationBar(
        items: const <Widget>[Icon(Icons.fitness_center), Icon(Icons.search)],
        index: 0,
        height: 50,
        color: Colors.white.withOpacity(0.2),
        buttonBackgroundColor: Colors.white,
        backgroundColor: Theme.of(context).primaryColor,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 750),
        onTap: (int index) {
          setState(() => sectionIndex = index);
        });
    return Container(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: Text('MaxFit' + (sectionIndex == 0 ? '// Active' : '// Find')),
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
        body: sectionIndex == 0 ? ActiveWorkouts() : WorkoutsList(),
        bottomNavigationBar: navigationBar,
        // bottomNavigationBar: BottomNavigationBar(
        //   items: const <BottomNavigationBarItem>[
        //     BottomNavigationBarItem(
        //         icon: Icon(Icons.fitness_center), label: 'My Workouts'),
        //     BottomNavigationBarItem(
        //         icon: Icon(Icons.search), label: 'Find Workouts'),
        //   ],
        //   backgroundColor: Colors.white30,
        //   currentIndex: sectionIndex,
        //   selectedItemColor: Colors.white,
        //   onTap: (int index) {
        //     setState(() => sectionIndex = index);
        //   },
        // ),
      ),
    );
  }
}
