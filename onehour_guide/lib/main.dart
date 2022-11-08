import 'package:flutter/material.dart';
import 'package:onehour_guide/home_page.dart';
import 'package:onehour_guide/profile_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  RootPage({Key? key}) : super(key: key);
  static int mushusAdded = 0;

  final mushProvider = Provider((ref) {
    return mushusAdded;
  });

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;

  List<Widget> pages = [const HomePage(), ProfilePage(RootPage.mushusAdded)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mushapp"),
      ),
      body: pages[currentPage],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          RootPage.mushusAdded += 1;
          debugPrint("Mush ${RootPage.mushusAdded} added.");

          if (currentPage == 1) {
            pages[currentPage].setState(() {
              currentPage = 1;
              debugPrint("Refreshing page");
            });
          }
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
            debugPrint("Set page $currentPage");
          });
          currentPage = index;
        },
        selectedIndex: currentPage,
      ),
    );
  }
}
