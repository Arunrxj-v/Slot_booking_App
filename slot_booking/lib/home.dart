import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Home",
            style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(30),
        ),
        backgroundColor: const Color.fromARGB(255, 4, 153, 194),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 30,
                  right: 15,
                  left: 15,
                  bottom: 0,
                ),
                height: 200,
                width: double.infinity,

                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 218, 226, 226),
                ),
                child: Image.network(
                  "https://ceconline.edu/wp-content/uploads/2024/05/pic1-01-1-1024x576.jpeg",
                ),
              ),
              SizedBox(height: 20),
              Divider(
                indent: 10,
                endIndent: 10,
                thickness: 2,
                color: const Color.fromARGB(255, 4, 153, 194),
              ),

              Container(
                margin: EdgeInsets.only(top: 0, right: 20, left: 20, bottom: 0),
                width: double.infinity,
                height: 540,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 50),

                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(170, 150),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(20),
                            ),
                            side: BorderSide(
                              color: const Color.fromARGB(255, 18, 136, 210),
                              width: 1,
                              style: BorderStyle.solid,
                            ),
                            backgroundColor: const Color.fromARGB(
                              255,
                              248,
                              253,
                              255,
                            ),
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                "Assets/room.png",
                                scale: 0.7,
                                color: const Color.fromARGB(255, 4, 153, 194),
                              ),
                              SizedBox(height: 10),
                              Text(
                                """Available 
  Rooms""",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 12),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(170, 150),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(20),
                            ),
                            side: BorderSide(
                              color: const Color.fromARGB(255, 18, 136, 210),
                              width: 1,
                              style: BorderStyle.solid,
                            ),
                            backgroundColor: const Color.fromARGB(
                              255,
                              248,
                              253,
                              255,
                            ),
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                "Assets/event s.png",
                                scale: 0.7,
                                color: const Color.fromARGB(255, 4, 153, 194),
                              ),
                              SizedBox(height: 10),
                              Text(
                                """Scheduled 
   Events""",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(170, 150),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(20),
                            ),
                            side: BorderSide(
                              color: const Color.fromARGB(255, 18, 136, 210),
                              width: 1,
                              style: BorderStyle.solid,
                            ),
                            backgroundColor: const Color.fromARGB(
                              255,
                              248,
                              253,
                              255,
                            ),
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                "Assets/book.png",
                                scale: 0.7,
                                color: const Color.fromARGB(255, 4, 153, 194),
                              ),
                              SizedBox(height: 10),

                              Text(
                                """Book Slots""",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 12),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(170, 150),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(20),
                            ),
                            side: BorderSide(
                              color: const Color.fromARGB(255, 18, 136, 210),
                              width: 1,
                              style: BorderStyle.solid,
                            ),
                            backgroundColor: const Color.fromARGB(
                              255,
                              248,
                              253,
                              255,
                            ),
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                "Assets/event upcoming.png",
                                scale: 0.7,
                                color: const Color.fromARGB(255, 4, 153, 194),
                              ),
                              SizedBox(height: 10),
                              Text(
                                """Upcoming 
   Events""",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
