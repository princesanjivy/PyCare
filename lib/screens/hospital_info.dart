import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pycare/Components/colors.dart';

class HospitalStatus extends StatefulWidget {
  @override
  _HospitalStatusState createState() => _HospitalStatusState();
}

class _HospitalStatusState extends State<HospitalStatus> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
        child: BottomNavigationBar(
          onTap: (clickedIndex) {
            setState(() {
              _selectedIndex = clickedIndex;
            });
          },
          currentIndex: _selectedIndex,
          backgroundColor: navColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          selectedLabelStyle: GoogleFonts.poppins(
            fontSize: 14,
            color: secondaryBlue,
          ),
          unselectedLabelStyle: GoogleFonts.poppins(
            fontSize: 12,
            color: secondaryBlue,
          ),
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: 'Details',
            ),
          ],
        ),
      ),
      backgroundColor: bgCol,
      body: Padding(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              'https://images.unsplash.com/photo-1613377512409-59c33c10c821?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 250,
                        child: Container(
                          child: Padding(
                            padding: EdgeInsets.only(left: 15, top: 10),
                            child: Text(
                              'Hospital Name',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: Colors.white,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                            color: secondaryBlue,
                          ),
                          height: 50,
                          width: 300,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Number of O2 Available :',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: secondaryBlue,
                          ),
                        ),
                        //Space to Add the widget that shows the fetched data from backend.
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Text(
                          'Number of Beds Available :',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: secondaryBlue,
                          ),
                        ),
                        //Space to Add the widget that shows the fetched data from backend.
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Text(
                          'Contact Number :',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: secondaryBlue,
                          ),
                        ),
                        //Space to Add the widget that shows the fetched data from backend.
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Text(
                          'Address :',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: secondaryBlue,
                          ),
                        ),
                        //Space to Add the widget that shows the fetched data from backend.
                      ],
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
