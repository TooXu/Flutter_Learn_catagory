import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class ListViewHeart extends StatefulWidget {
  @override
  ListViewHeartState createState() => new ListViewHeartState();
}

class ListViewHeartState extends State<ListViewHeart> {
  final _suggestions = <WordPair>[];
  final _saved = new Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: Text('widget'),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.list),
              onPressed:_pushSaved
          ),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute(
          builder: (context){
            final titles = _saved.map(
                (pair){
                  print(pair);
                  return new ListTile(
                    title: new Text(
                      pair.asPascalCase,
                      style: TextStyle(fontSize: 19.0),
                    ),
                  );
                }
            );
            final divided = ListTile
                .divideTiles(
                context: context,
                tiles: titles,
            )
            .toList();

            return new Scaffold(
              appBar:  new AppBar(
                title: new Text('Saved suggestions'),
              ),
              body: new ListView(children:divided),
            );
          },
      ),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(itemBuilder: (context, i) {
      // 如果 i 为奇数 返回 divider
      if (i.isOdd)
        return Divider(
          color: Colors.red,
        );

      // 如果 i 为偶数 返回 _buildRow的结果
      //TODO index 表达式的含义??
      final index = i ~/ 2;

      if (index >= _suggestions.length) {
        _suggestions.addAll(generateWordPairs().take(10));
      }
      return _buildRow(_suggestions[index]);
    });
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);

    return ListTile(

      title:new Text(
        pair.asPascalCase,
        style: TextStyle(fontSize: 10),
      ),

      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ?Colors.red : null,
      ),

      // onTap 的实现方式
      onTap: () {
        /// 在 Flutter 的响应式风格框架中，调用 setState() ，将为 State 对象触发 build() 方法的调用，从而实现对UI的更新。
        setState(() {
          if(alreadySaved){
            _saved.remove(pair);
          }else{
            _saved.add(pair);
          }
        });
      },

    );
  }
}
