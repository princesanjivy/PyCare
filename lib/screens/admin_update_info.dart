import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pycare/Components/colors.dart';

class AdminUpdateInfo extends StatefulWidget {
  @override
  _AdminUpdateInfo createState() => _AdminUpdateInfo();
}

class _AdminUpdateInfo extends State<AdminUpdateInfo> {
  int _selectedIndex = 0;
  TextEditingController _noOfO2 = new TextEditingController();
  TextEditingController _noOfbeds = new TextEditingController();
  TextEditingController _contactNo = new TextEditingController();
  TextEditingController _address = new TextEditingController();

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
          unselectedItemColor: Colors.black26,
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
                label: 'Details'),
          ],
        ),
      ),
      backgroundColor: bgCol,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: SafeArea(
            minimum: EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 20,
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
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                ),
                                color: secondaryBlue,
                              ),
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
                        TextField(
                          controller: _noOfO2,
                          cursorColor: secondaryBlue,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 20),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: secondaryBlue,
                              ),
                            ),
                            labelText: 'Number of O2 available',
                            labelStyle: GoogleFonts.poppins(
                              fontSize: 14,
                              color: secondaryBlue,
                              letterSpacing: 1.0,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: secondaryBlue),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        TextField(
                          controller: _noOfbeds,
                          cursorColor: secondaryBlue,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 20),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: secondaryBlue,
                              ),
                            ),
                            labelText: 'Number of Beds available',
                            labelStyle: GoogleFonts.poppins(
                              fontSize: 14,
                              color: secondaryBlue,
                              letterSpacing: 1.0,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: secondaryBlue),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        TextField(
                          controller: _contactNo,
                          cursorColor: secondaryBlue,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 20),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: secondaryBlue,
                              ),
                            ),
                            labelText: 'Contact',
                            labelStyle: GoogleFonts.poppins(
                              fontSize: 14,
                              color: secondaryBlue,
                              letterSpacing: 1.0,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: secondaryBlue),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        TextField(
                          controller: _address,
                          cursorColor: secondaryBlue,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 20),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: secondaryBlue,
                              ),
                            ),
                            labelText: 'Address',
                            labelStyle: GoogleFonts.poppins(
                              fontSize: 14,
                              color: secondaryBlue,
                              letterSpacing: 1.0,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: secondaryBlue),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () async {},
                          style: ButtonStyle(
                            // elevation: MaterialStateProperty.all<double>(15),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(19),
                              ),
                            ),
                            minimumSize:
                                MaterialStateProperty.all<Size>(Size(120, 50)),
                            backgroundColor:
                                MaterialStateProperty.all((primaryBlue)),
                          ),
                          child: Text(
                            'Cancel',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.white,
                              letterSpacing: 1.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                          onPressed: () async {}, //Backend Code to be added
                          style: ButtonStyle(
                            // elevation: MaterialStateProperty.all<double>(15),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(19),
                              ),
                            ),
                            minimumSize:
                                MaterialStateProperty.all<Size>(Size(120, 50)),
                            backgroundColor:
                                MaterialStateProperty.all((secondaryBlue)),
                          ),
                          child: Text(
                            'Save',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.white,
                              letterSpacing: 1.0,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
