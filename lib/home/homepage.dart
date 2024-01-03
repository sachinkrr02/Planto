import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Discover"),
        actions: <Widget>[
          Icon(Icons.person_2_rounded),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 10, 20),
              child: TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    hintText: "Search",
                    suffixIcon: Icon(Icons.search),
                    fillColor: Colors.grey,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(50))),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              height: 100,
              child: Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) => Card(
                    color: Colors.grey,
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/lo1.png',
                          height: 70,
                        ),
                        Text('Plants'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.lightGreen),
              height: 100,
            ),
            Container(
              height: 400,
              child: itemDisplay(),
            )
          ],
        ),
      ),
    );
  }
}

class Variety extends StatelessWidget {
  const Variety({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 3,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            height: 50,
            width: 50,
            color: Colors.grey,
          ),
        );
      },
    );
  }
}

class itemDisplay extends StatelessWidget {
  const itemDisplay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 20,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            height: 50,
            width: 50,
            color: Colors.green,
          ),
        );
      },
    );
  }
}
