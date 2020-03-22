import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Layout Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Layout Demo'),
        ),
        body: Column(
          children: <Widget>[titleSection],
        ),
      )
    );
  }

  Widget titleSection = Container(
    padding: EdgeInsets.all(32),
    child: Row(
      children: [
        // Expanded ウィジェット内に Column を置くことで、余りの領域すべてを使うことが出来る
        Expanded(child: Column(
          // 左側基準で始まることを宣言
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // padding を置きたいため Text 直接でなく、Container の内部に Text を置く作りにしている
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                'Oeschinen Lake Campground',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            // サブの文字列。グレーにしてある
            Text(
              'Kandersteg, Switzerland',
              style: TextStyle(color: Colors.grey[500]),
            )
          ],
        )),
        Icon(
          Icons.star,
          color: Colors.red[500],
        ),
        Text('41'),
      ],
    ),
  );
}
