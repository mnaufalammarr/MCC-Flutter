import 'package:flutter/material.dart';

import '../model/quotes.dart';
import '../quotes_card.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePage createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  List<Quote> quotes = [
    Quote(
        author: 'Oscar Wilde',
        text: 'Be yourself; everyone else is already taken'),
    Quote(
        author: 'Oscar Wilde',
        text: 'I have nothing to declare except my genius'),
    Quote(
        author: 'Oscar Wilde',
        text: 'The truth is rarely pure and never simple')
  ];
  bool greyBg = false;
  @override
  Widget build(BuildContext context) {
    Color? bgColor = greyBg ? Colors.grey : Colors.white;
    final Set? data = ModalRoute.of(context)?.settings.arguments as Set?;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text("Awesome Quotes"),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${data?.join(', ')}"),
              ],
            ),
            Column(
              children: quotes
                  .map((quote) => QuoteCard(
                        quote: quote,
                        delete: () {
                          setState(() {
                            quotes.remove(quote);
                            if (greyBg == false) {
                              print('a');
                              greyBg = true;
                            } else {
                              greyBg = false;
                            }
                          });
                        },
                      ))
                  .toList(),
            ),
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Navigator.pushNamed(context, '/select', arguments: quotes);
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
