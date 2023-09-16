import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:intl/intl.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:avatar_glow/avatar_glow.dart';

class fakerDart extends StatefulWidget {
  @override
  State<fakerDart> createState() => _fakerDartState();
}

class _fakerDartState extends State<fakerDart> {
  var faker = new Faker();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [
      ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) => ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey[300],
            backgroundImage:
                NetworkImage('https://loremflickr.com/${100 + index}/320/240'),
          ),
          title: Text(faker.person.name()),
          subtitle: Text("Joined on: " +
              "${DateFormat.yMMMEd().format(Faker().date.dateTime(minYear: 2018, maxYear: 2023))}"),
        ),
      ),
      Center(
          child:
          Column(
            children: [
                  Text("This period's winner is:"),
               AvatarGlow(
              child: Material(
                shape: CircleBorder(),
                child: CircleAvatar(
                  backgroundColor: Colors.grey[100],
                  backgroundImage:
                      NetworkImage('https://loremflickr.com/123/320/240'),
                  radius: 100,
                ),
              ),
              glowColor: Colors.lightBlueAccent,
              endRadius: 150),
            Text(faker.person.name()),
            ],
          )
          ),
      Center(
        child: Text("Menu 3"),
      ),
      Center(
        child: Text("Menu 4"),
      ),
      Center(
        child: Text("Menu 5"),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("faker + INTL"),
        centerTitle: true,
      ),
      body: widgetList[currentIndex],
      bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.map, title: 'Discovery'),
          TabItem(icon: Icons.add, title: 'Add'),
          TabItem(icon: Icons.message, title: 'Message'),
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
        style: TabStyle.textIn,
        initialActiveIndex: 0, //optional, default as 0
        onTap: (int i) {
          setState(() {
            currentIndex = i;
          });
        },
      ),
    );
  }
}
