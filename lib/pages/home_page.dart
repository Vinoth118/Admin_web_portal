import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            color: Colors.white,
            child: Container(
              height: 120,
              width: MediaQuery.of(context).size.width * 0.2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.trending_up,
                      color: Colors.green,
                      size: 50,
                    ),
                    Text(
                      '10 Sales today',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
