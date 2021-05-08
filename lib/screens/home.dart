import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  //int _currIndex = 0;

  final List<String> entries = <String>[
    'Hospital Name',
    'Hospital Name',
    'Hospital Name',
    'Hospital Name',
    'Hospital Name'
  ];
  //final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(249, 249, 249, 1),
      appBar: AppBar(
        title: Text("Hospitals"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: entries.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                child: Card(
                  color: (index % 2 == 0)
                      ? Color.fromRGBO(92, 132, 141, 1)
                      : Color.fromRGBO(157, 212, 243, 1),
                  child: ListTile(
                    leading: Icon(
                      Icons.house,
                      size: 56.0,
                    ),
                    title: Text('${entries[index]}'),
                    //subtitle: Text('Address of Hospital'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    //onTap: () {},
                  ),
                ),
              );
            }),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        backgroundColor: Colors.blue,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'About Us',
          ),
        ],
        selectedItemColor: Colors.white,
        // onTap: () {},
      ),
    );
  }
}
