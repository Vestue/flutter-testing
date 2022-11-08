import 'package:flutter/material.dart';
import 'package:onehour_guide/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePage extends StatefulWidget {
  int mushusAdded;

  ProfilePage(this.mushusAdded, {Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: RootPage.mushusAdded,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text('Mush ${(index + 1)}'),
          leading: (index.isEven)
              ? Image.asset(
                  'images/anothermush2.png',
                  height: 40,
                  width: 60,
                )
              : Image.asset(
                  'images/cutemush.jpg',
                  height: 40,
                  width: 60,
                ),
          trailing: const Icon(Icons.person_add_alt_1_rounded),
          onTap: () {
            debugPrint("Item ${(index + 1)} selected");
          },
        );
      },
    );
  }
}
