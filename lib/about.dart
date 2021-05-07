import 'package:flutter/material.dart';

class About extends StatelessWidget {
  //int _currIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(249, 249, 249, 1),
      appBar: AppBar(
        title: Text("About Us"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: <Widget>[
            Text(
              "DEVELOPERS",
              style: TextStyle(
                fontSize: 20,
                height: 2,
              ),
            ),
            Card(
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 65,
                    backgroundColor: Colors.blue,
                    //backgroundImage: Image(),
                  ),
                  Text(
                    "Prince Sanjivy",
                    style: TextStyle(
                      fontSize: 16,
                      height: 3,
                    ),
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 65,
                    backgroundColor: Colors.blue,
                    //backgroundImage: Image(),
                  ),
                  Text(
                    "Vignesh Hendrix",
                    style: TextStyle(
                      fontSize: 16,
                      height: 3,
                    ),
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 65,
                    backgroundColor: Colors.blue,
                    //backgroundImage: Image(),
                  ),
                  Text(
                    "Ayush Singh",
                    style: TextStyle(
                      fontSize: 16,
                      height: 3,
                    ),
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 65,
                    backgroundColor: Colors.blue,
                    backgroundImage: NetworkImage(
                        "https://lh3.googleusercontent.com/ogw/ADGmqu9CyT59CjK8TDDz0Uu4fpO4R46czdErQfhDD5opDQ=s83-c-mo"),
                  ),
                  Text(
                    "Anshul Sharma",
                    style: TextStyle(
                      fontSize: 16,
                      height: 3,
                    ),
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 65,
                    backgroundColor: Colors.blue,
                    //backgroundImage: Image(),
                  ),
                  Text(
                    "Akshay",
                    style: TextStyle(
                      fontSize: 16,
                      height: 3,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 1,
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
