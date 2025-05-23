import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyHome());
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  double avaliableScreenWidth = 0;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    avaliableScreenWidth = MediaQuery.of(context).size.width - 50;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
            alignment: Alignment.bottomCenter,
            height: 170,
            decoration: BoxDecoration(color: Colors.blue.shade800),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Riotters",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Team folder",
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black.withValues(alpha: .1),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.search, size: 28, color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black.withValues(alpha: .1),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.notifications,
                          size: 28,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: const TextSpan(
                    text: "Storage ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: "9.1/10GB",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const Text(
                  "Upgrade",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                buildFileSizeChart("SOURCES", Colors.blue, .3),
                const SizedBox(width: 2),
                buildFileSizeChart("DOCS", Colors.red, .25),
                const SizedBox(width: 2),
                buildFileSizeChart("IMAGES", Colors.yellow, .20),
                const SizedBox(width: 2),
                buildFileSizeChart("", Colors.grey[200], .23),
              ],
            ),
          ),
          const SizedBox(height: 15),
          const Divider(height: 20),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(25),
              children: [
                const Text(
                  "Recently updated",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    buildFileColumn('sketch', 'desktop', '.sketch'),
                    SizedBox(width: avaliableScreenWidth * .03),
                    buildFileColumn('sketch', 'mobile', '.sketch'),
                    SizedBox(width: avaliableScreenWidth * .03),
                    buildFileColumn('prd', 'interaction', '.prd'),
                  ],
                ),
                Divider(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Projects ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Create new",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                buildProjectRow("Chatbox"),
                buildProjectRow("TimeNote"),
                buildProjectRow("Something"),
                buildProjectRow("Other"),
              ],
            ),
          ),
        ],
      ),

      floatingActionButton: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(color: Colors.white, spreadRadius: 7, blurRadius: 1),
          ],
        ),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.blue,
          child: Icon(Icons.add, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        currentIndex: selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        fixedColor: Colors.blue,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.access_time), label: "Time"),
          BottomNavigationBarItem(icon: Icon(Icons.add_box), label: "Folder"),
        ],
      ),
    );
  }

  Container buildProjectRow(String folderName) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 65,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.folder, color: Colors.blue[200]),
              const SizedBox(width: 12),
              Text(folderName, style: const TextStyle(fontSize: 16)),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert_rounded, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Column buildFileColumn(String image, String filename, String extension) {
    return Column(
      children: [
        Container(
          width: avaliableScreenWidth * .31,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: EdgeInsets.all(38),
          height: 110,
          child: Image.asset('assets/images/$image.png'),
        ),
        const SizedBox(height: 15),
        RichText(
          text: TextSpan(
            text: filename,
            style: TextStyle(color: Colors.black, fontSize: 14),
            children: [
              TextSpan(
                text: extension,
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column buildFileSizeChart(
    String title,
    Color? color,
    double widthPercentage,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: avaliableScreenWidth * widthPercentage,
          height: 4,
          color: color,
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
