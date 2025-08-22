import 'package:flutter/material.dart';
import 'package:movie_app/movies/presentation/screens/movies_screen.dart';
class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ElevatedButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>MoviesScreen()));

        }, child: Text('Go')),
      ),
    );
  }
}
