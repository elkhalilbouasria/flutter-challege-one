import 'package:flutter/material.dart';
import 'package:flutter_challenge_1/widgets/BottomNavigationWidget.dart';
class DiscoverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationWidget(),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: SafeArea(
          top: true,
          child: Center(
            child: Text(
              "Discover",
              style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.w200,
                  fontSize: 30
              ),
            ),
          ),
        ),
      ),
    );
  }
}
