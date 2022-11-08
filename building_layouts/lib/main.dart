// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /*2*/
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: const Text(
                      'Some lake somewhere',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    'Some country',
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                ],
              ),
          ),
          Icon(
            Icons.star,
            color: Colors.yellow[500],
          ),
          const Text('42')
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;
    Widget buttonSection = Row (
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, "CALL"),
        _buildButtonColumn(color, Icons.near_me, "ROUTE"),
        _buildButtonColumn(color, Icons.share, "SHARE"),
      ],
    );

    Widget textSection = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'Jean-François Champollion cosmic fugue astonishment take root and'
        'flourish Sea of Tranquility circumnavigated. Gathered by gravity stirred'
        'by starlight corpus callosum concept of the number one are creatures of'
        'the cosmos citizens of distant epochs. Dispassionate extraterrestrial'
        'observer something incredible is waiting to be known a very small stage'
        'in a vast cosmic arena vanquish the impossible the ash of stellar alchemy'
        'paroxysm of global death. Extraplanetary with pretty stories for which'
        'theres little good evidence with pretty stories for which theres little'
        'good evidence hundreds of thousands with pretty stories for which theres'
        'little good evidence with pretty stories for which theres little good'
        'evidence and billions upon billions upon billions upon billions upon'
        'billions upon billions upon billions.',
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Layout test'),
        ),
        body: Column(
          children: [
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color,),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        )
      ],
    );
  }
}