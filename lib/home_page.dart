import 'package:flutter/material.dart';
import 'package:vibe_copilot_task/screens/comment_log_switcher.dart';

const IconData plumbing = IconData(0xe4d5, fontFamily: 'MaterialIcons');
const IconData motorcycle = IconData(0xe40a, fontFamily: 'MaterialIcons');

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<IconData> _icons = [
    Icons.plumbing,
    Icons.engineering,
    Icons.electrical_services,
  ];
  final List<String> _iconLabels = ["Plumbing", "Civil", "Profile"];
  double getPosition(double width) {
    double itemWidth = width / _icons.length;
    return (itemWidth * _selectedIndex) + (itemWidth / 2) - 30;
  }

  @override
  Widget build(BuildContext context) {
    final double fullWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: SizedBox(
        height: 60,
        width: 60,
        child: FloatingActionButton(
          backgroundColor: Colors.black,

          shape: CircleBorder(),
          onPressed: () {},
          child: Icon(Icons.add, size: 50, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 60.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 10.0),
              child: Row(
                children: [
                  Text(
                    "Tower 1 / 301",
                    style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Icon(Icons.content_paste_search, size: 30),
                  const SizedBox(width: 20),
                  Icon(Icons.cloud_download, size: 30),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 15,
              children: [
                Text("Pending 200", style: TextStyle(fontSize: 18)),
                Text("WIP 5", style: TextStyle(fontSize: 18)),
                Text("Completed 50", style: TextStyle(fontSize: 18)),
              ],
            ),
            const SizedBox(height: 30),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                    right: 10.0,
                    bottom: 20.0,
                  ),
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black54),
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 10),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(_icons.length, (index) {
                        return GestureDetector(
                          onTap: () => setState(() => _selectedIndex = index),
                          child: Column(
                            children: [
                              Icon(
                                _icons[index],
                                size: 40,
                                color:
                                    _selectedIndex == index
                                        ? Colors.transparent
                                        : Colors.black,
                              ),
                              Text(
                                _iconLabels[index],
                                style: TextStyle(
                                  color:
                                      _selectedIndex == index
                                          ? Colors.blue
                                          : Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  top: -30,
                  left: getPosition(fullWidth),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 20,
                      left: 10,
                      right: 10,
                    ), // 👈 add your desired padding here
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 5),
                      ),
                      child: Icon(
                        _icons[_selectedIndex],
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Divider(color: Colors.grey, height: 10, thickness: 1),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Row(
                  children: [
                    RotatedBox(
                      quarterTurns: 1,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 10.0,
                              right: 10.0,
                              bottom: 9.0,
                            ),
                            child: Container(
                              height: 80,
                              width: 450,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black54),
                                color: Colors.yellow,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: List.generate(_icons.length, (
                                    index,
                                  ) {
                                    return GestureDetector(
                                      onTap:
                                          () => setState(
                                            () => _selectedIndex = index,
                                          ),
                                      child: Column(
                                        children: [
                                          Icon(
                                            _icons[index],
                                            size: 40,
                                            color:
                                                _selectedIndex == index
                                                    ? Colors.transparent
                                                    : Colors.black,
                                          ),
                                          Text(
                                            _iconLabels[index],
                                            style: TextStyle(
                                              color:
                                                  _selectedIndex == index
                                                      ? Colors.blue
                                                      : Colors.black,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            ),
                          ),
                          AnimatedPositioned(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            top: -30,
                            left: getPosition(fullWidth),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                bottom: 20,
                                left: 10,
                                right: 10,
                              ), // 👈 add your desired padding here
                              child: Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 5,
                                  ),
                                ),
                                child: Icon(
                                  _icons[_selectedIndex],
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 30),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: Container(
                        height: 400,
                        width: 270,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black54),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 10),
                          ],
                        ),
                        child: Column(
                          spacing: 10,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 15.0,
                                right: 15,
                                top: 10,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    "Finishing",
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Row(
                                spacing: 5,
                                children: [
                                  Text("Mark All"),
                                  Container(
                                    height: 22,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(child: Text("Done")),
                                  ),
                                  Container(
                                    height: 22,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(child: Text("Not Done")),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Row(
                                children: [
                                  Text("1. Frame alignment not proper"),
                                  Icon(Icons.camera_alt_rounded),
                                  Icon(Icons.messenger),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                spacing: 10,
                                children: [
                                  Container(
                                    height: 22,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(child: Text("Pass")),
                                  ),
                                  Container(
                                    height: 22,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(child: Text("Fail")),
                                  ),
                                  Container(
                                    height: 22,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(child: Text("N/A")),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    "2. Damages/cracks/scratch\n    marks onsliding Glass",
                                  ),
                                ),
                                SizedBox(width: 18),
                                Icon(Icons.camera_alt_rounded),
                                Icon(Icons.messenger),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                spacing: 10,
                                children: [
                                  Container(
                                    height: 22,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(child: Text("Pass")),
                                  ),
                                  Container(
                                    height: 22,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(child: Text("Fail")),
                                  ),
                                  Container(
                                    height: 22,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(child: Text("N/A")),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    "3. Rubber lining missing/not\n    fixed properly",
                                  ),
                                ),
                                SizedBox(width: 18),
                                Icon(Icons.camera_alt_rounded),
                                Icon(Icons.messenger),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                spacing: 10,
                                children: [
                                  Container(
                                    height: 22,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(child: Text("Pass")),
                                  ),
                                  Container(
                                    height: 22,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(child: Text("Fail")),
                                  ),
                                  Container(
                                    height: 22,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(child: Text("N/A")),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    "4. Sealant not applied/ non\n    uniformly applied",
                                  ),
                                ),
                                SizedBox(width: 18),
                                Icon(Icons.camera_alt_rounded),
                                Icon(Icons.messenger),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                spacing: 10,
                                children: [
                                  Container(
                                    height: 22,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(child: Text("Pass")),
                                  ),
                                  Container(
                                    height: 22,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(child: Text("Fail")),
                                  ),
                                  Container(
                                    height: 22,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(child: Text("N/A")),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: -1,
                  right: 110,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommentLogSwitcher(),
                        ),
                      );
                    },
                    child: Text("Submit"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
