import 'package:flutter/material.dart';

class MushuBestPage extends StatefulWidget {
  const MushuBestPage({Key? key}) : super(key: key);

  @override
  State<MushuBestPage> createState() => _MushuBestPageState();
}

class _MushuBestPageState extends State<MushuBestPage> {
  bool isSwitch = false;
  bool? isCheckbox = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mushu is loved'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          Image.asset('images/cutemush.jpg'),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            color: Colors.black,
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.all(10.0),
            color: Colors.green,
            width: double.infinity,
            child: const Center(
              child: Text(
                'This is a mush.',
                style: TextStyle(
                  color: Colors.white,
                  //fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: isSwitch ? Colors.blue : Colors.pink,
            ),
            onPressed: () {
              debugPrint('Mush button pressed');
            },
            child: const Text('Mush button'),
          ),
          OutlinedButton(
            onPressed: () {
              debugPrint('Outlined button pressed');
            },
            child: const Text('Outlined mush'),
          ),
          TextButton(
              onPressed: () {
                debugPrint('Text button');
              },
              child: const Text(
                'The Mushu is a rare being, only a few have been blessed by the Mush.',
                style: TextStyle(color: Colors.white),
              )),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              debugPrint('Testing gestures');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(
                  Icons.traffic,
                  color:  Colors.blue,
                ),
                Text('Blue mush?'),
                Icon(
                  Icons.museum,
                  color: Colors.blue,
                ),
              ],
            ),
          ),
          Switch(
              value: isSwitch,
              onChanged: (bool newBool) {
                setState(() {
                  isSwitch = newBool;
                });
              }),
          Checkbox(
              value: isCheckbox,
              onChanged: (bool? newBool){
                setState(() {
                  isCheckbox = newBool;
                });
              }),
        ],
      ),
    );
  }
}
