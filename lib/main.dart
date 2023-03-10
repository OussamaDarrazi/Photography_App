// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// final categories = <String>["Nature", "Beautiful Landscape", "Wildlife", "Creative"];
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
        backgroundColor: Colors.transparent,
        tabMargin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        padding: EdgeInsets.all(10),
        color: Colors.grey,
        tabBackgroundColor: Color(0xFF3742FA),
        activeColor: Colors.white,
        gap: 8,
        tabs: const [
          GButton(
            icon: Icons.home_rounded,
            text: "Home",
          ),
          GButton(
            icon: Icons.calendar_month,
            text: "Agenda",
          ),
          GButton(
            icon: Icons.bubble_chart,
            text: "Messages",
          ),
          GButton(
            icon: Icons.person,
            text: "Profile",
          ),
        ],
      ),
      backgroundColor: const Color(0xFFF1F2F6),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: UserHeader(name: "Samantha James", sub: "Photographer"),
        ),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: SearchRow(),
        ),
        SizedBox(
          height: 30,
        ),
        CategoryListView(categories: <String>[
          "Nature",
          "Beautiful Landscape",
          "Wildlife",
          "Creative"
        ]),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Recent Photograhy",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "View All",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3742FA)),
              ),
            ],
          ),
        ),
        RecentPhotosListView(),
      ]),
    );
  }
}

class RecentPhotosListView extends StatelessWidget {
  const RecentPhotosListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 20,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(top: 10, bottom: 10, left: 15),
              padding: EdgeInsets.all(25),
              width: 300,
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(
                  color: Colors.black.withOpacity(.25),
                  offset: Offset(3, 5),
                  blurRadius: 10,
                )],
                  borderRadius: BorderRadius.circular(40),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://images.unsplash.com/photo-1677419734433-2420e3bf1093?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80"))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                Expanded(
                    child: Container(
                  alignment: Alignment.topRight,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(.3),
                        borderRadius: BorderRadius.circular(20)),
                    width: 40,
                    height: 40,
                    child: Icon(
                      Icons.favorite_outline_rounded,
                      color: Colors.white,
                    ),
                  ),
                )),
                Text("Wildlife Photography", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),),
                Text("Landscape covered with snow...🌲", style: TextStyle(color: Colors.white),),
                SizedBox(height: 20,)
              ]),
            );
          }),
    );
  }
}

class CategoryListView extends StatelessWidget {
  final List<String> categories;
  const CategoryListView({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (context, index) {
            return CategoryTile(childtext: categories[index]);
          }),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String childtext;
  const CategoryTile({
    super.key,
    required this.childtext,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      height: 20,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: EdgeInsets.only(left: 20),
      child: Text(childtext),
    );
  }
}

class SearchRow extends StatelessWidget {
  const SearchRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.center,
            height: 48,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 10),
                  blurRadius: 20,
                  color: const Color(0xFF2F3542).withOpacity(.1))
            ], color: Colors.white, borderRadius: BorderRadius.circular(30)),
            child: const TextField(
              textAlignVertical: TextAlignVertical.bottom,
              style: TextStyle(fontSize: 12),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    color: Color(0xff2F3542),
                  ),
                  hintText: "Search for photos..."),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xFF3742FA),
              boxShadow: [
                BoxShadow(
                    color: const Color(0xFF3742FA).withOpacity(.5),
                    offset: const Offset(0, 10),
                    blurRadius: 20)
              ]),
          child: const Icon(
            Icons.tune_rounded,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}

class UserHeader extends StatelessWidget {
  final String name;
  final String sub;
  const UserHeader({
    super.key,
    required this.name,
    required this.sub,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(
              "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80"),
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2F3542)),
              ),
              Text(
                sub,
                style: TextStyle(
                    fontSize: 12,
                    color: const Color(0xFF2F3542).withOpacity(0.5)),
              )
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(55, 66, 250, 0.1),
              borderRadius: BorderRadius.circular(20)),
          child: Stack(
            children: const [
              Icon(
                Icons.notifications_none,
              ),
            ],
          ),
        )
      ],
    );
  }
}
