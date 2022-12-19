import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(appBarTheme: AppBarTheme(backgroundColor: Colors.amber, foregroundColor: Colors.white)),
      
      debugShowCheckedModeBanner: false,
      home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({super.key});

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerfont = const TextStyle(fontSize: 18);
  final _saved = <WordPair>{};

  void _pushSaved() {
    Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
      final tiles = _saved.map((e) {
        return ListTile(
          title: Text(
            e.asPascalCase,
            style: _biggerfont,
          ),
        );
      });
      final divided = tiles.isNotEmpty
          ? ListTile.divideTiles(
              context: context,
              tiles: tiles,
            ).toList()
          : <Widget>[];
      return Scaffold(
        appBar: AppBar(title: Text("Saved Suggestions")),
        body: ListView(children: divided),
      );
    })));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("First App"),
          actions: [
            IconButton(
              onPressed: _pushSaved,
              icon: Icon(Icons.list),
              tooltip: "saved suggestions",
            )
          ],
        ),
        body: ListView.builder(itemBuilder: ((context, index) {
          if (index.isOdd) return const Divider();

          final i = index ~/ 2;
          if (i >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }

          final _alreadysaved = _saved.contains(_suggestions[i]);
          return ListTile(
            title: Text(
              _suggestions[i].asPascalCase,
              style: _biggerfont,
            ),
            trailing: Icon(
              _alreadysaved ? Icons.favorite : Icons.favorite_border,
              color: _alreadysaved ? Colors.red : null,
              semanticLabel: _alreadysaved ? "Remove from Saved" : "save",
            ),
            onTap: () {
              setState(() {
                if (_alreadysaved) {
                  _saved.remove(_suggestions[i]);
                } else {
                  _saved.add(_suggestions[i]);
                }
              });
            },
          );
        })));
  }
}
