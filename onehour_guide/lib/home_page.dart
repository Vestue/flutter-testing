import 'package:flutter/material.dart';
import 'package:onehour_guide/mushu_doggo.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: (){
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (BuildContext context){
                  return const MushuBestPage();
                }),
          );
        },
        child: const Text('Mushu is the best doggo'),
      ),
    );
  }
}
