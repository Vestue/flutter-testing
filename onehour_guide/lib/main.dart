import 'package:flutter/material.dart';
import 'package:onehour_guide/home_page.dart';
import 'package:onehour_guide/profile_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
  const RootPage({Key? key}) : super(key: key);
  static int mushusAdded = 0;

  static final mushProvider = Provider((ref) {
    return mushusAdded;
  });

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;
  List<Widget> pages = [];

  @override
  void initState() {
    pages = [const HomePage(), ProfilePage(RootPage.mushusAdded)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mushapp"),
      ),
      body: pages[currentPage],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            RootPage.mushusAdded += 1;
          });
          debugPrint("Mush ${RootPage.mushusAdded} added.");
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
