import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class EdittaskBoardPage extends StatefulWidget {
  const EdittaskBoardPage({super.key});

  @override
  State<EdittaskBoardPage> createState() => _EdittaskBoardPageState();
}

class _EdittaskBoardPageState extends State<EdittaskBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LISTINHA'),
      ),
    );
  }
}
