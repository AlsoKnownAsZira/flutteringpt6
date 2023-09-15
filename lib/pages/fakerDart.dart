import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:intl/intl.dart';

class fakerDart extends StatelessWidget {
  var faker = new Faker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("faker + INTL"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) => ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey[300],
            backgroundImage:
                NetworkImage('https://loremflickr.com/${100 + index}/320/240'),
          ),
          title: Text(faker.person.name()),
          subtitle: Text("Joined on: "+ "${DateFormat.yMMMEd().format(Faker().date.dateTime(minYear: 2018, maxYear: 2023))}"),
        ),
      ),
    );
  }
}
