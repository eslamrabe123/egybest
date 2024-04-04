import 'package:egybest/movies_module/presentation/screens/movies_screen.dart';
import 'package:egybest/tv_module/presentation/screens/tv_screen.dart';
import 'package:flutter/material.dart';

class ChoiceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 200),
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 20.0,
            crossAxisSpacing: 20.0,
            children: [
              OptionCard(
                title: 'MOVIES',

                // description: '',
                color: Color(0xff641E16),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MoviesScreen(),
                    ),
                  );
                },
              ),
              OptionCard(
                title: 'TV SHOWS',
                // descri/ption: 'Description for Option 2',
                color: Color(0xff191970),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TVScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OptionCard extends StatelessWidget {
  final String title;

  //final String description;
  final Color color;
  final VoidCallback onTap;

  const OptionCard({
    required this.title,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            // Text(
            //   description,
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 16.0,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
