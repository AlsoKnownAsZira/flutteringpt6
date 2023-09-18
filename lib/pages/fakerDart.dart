import 'package:dropdown_search/dropdown_search.dart';
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
  List<Map<String, dynamic>> dataList = [
    {
      "country": "USA",
      "id": 1,
    },
    {
      "country": "UK",
      "id": 2,
    },
    {
      "country": "INDONESIA",
      "id": 3,
    },
    {
      "country": "JAPAN",
      "id": 4,
    },
    {
      "country": "South Korea",
      "id": 5,
    },
    {
      "country": "India",
      "id": 6,
    },
    {
      "country": "Italy",
      "id": 7,
    },
  ];
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
          child: Column(
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
      )),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownSearch<String>(
          popupProps: PopupProps.menu(
            showSelectedItems: true,
            showSearchBox: true,
            disabledItemFn: (String s) => s.startsWith('I') && s.endsWith('a'),
          ),
          items: [
            'USA',
            'UK',
            'Indonesia',
            'China',
            'Japan',
            'South Korea',
            'India',
            'Italy',
          ],
          onChanged: (value) => print("USER is from: ${value??null}"),
          selectedItem: 'USA',
          clearButtonProps: ClearButtonProps(isVisible: true),
        ),
      ),
      DropdownSearch<Map<String, dynamic>>(
        popupProps: PopupProps.menu(
          showSearchBox: true,
          disabledItemFn: (Map<String, dynamic> s) =>
              s['id'] == 3 || s['country'] == 'India',
        ),
        items: dataList,
        onChanged: (value) => print("USER is from: ${value?['country']}"),
        selectedItem: {
          "country": "USA",
          "id": 1,
        },

        dropdownBuilder: (context, selectedItem) => ListTile(
          textColor: Colors.red,
          title: Text(selectedItem?["country"]),
        ),
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
          TabItem(icon: Icons.home, title: 'Faker+Intl'),
          TabItem(icon: Icons.map, title: 'AvatarGlow'),
          TabItem(icon: Icons.add, title: 'DDS singleList'),
          TabItem(icon: Icons.message, title: 'DDS mapping '),
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
