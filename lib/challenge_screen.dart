import 'package:flutter/material.dart';

class ChallengeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            ChallengeColorView(),
            Positioned(
              bottom: 270,
              left: 55,
              child: Container(
                height: 185,
                width: 185,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.play_arrow),
        backgroundColor: Colors.blue,
      ),
    );
  }
}

class ChallengeColorView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            width: 100,
            height: double.infinity,
            color: Colors.white,
            child: Column(
              children: [
                RubikView(),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.black,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.yellow,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 20,
            child: Container(color: Colors.pinkAccent),
          ),
          Expanded(
            flex: 1,
            child: Container(color: Colors.white),
          ),
          Expanded(
            flex: 8,
            child: Container(color: Colors.pinkAccent),
          )
        ],
      ),
    );
  }
}

class RubikView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 120,
      child: Row(
        children: [
          Container(
            width: 30,
            child: Column(
              children: [
                Container(
                  height: 30,
                  color: Colors.grey,
                ),
                Container(
                  height: 30,
                  color: Colors.orange,
                ),
                Container(
                  height: 30,
                  color: Colors.blue,
                ),
                Container(
                  height: 30,
                  color: Colors.pink,
                )
              ],
            ),
          ),
          Container(
            width: 70,
            child: Column(
              children: [
                Container(
                  height: 90,
                  color: Colors.lightBlueAccent,
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.lightGreenAccent,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.yellow,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
