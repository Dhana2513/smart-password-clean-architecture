import 'package:flutter/material.dart';

class PatternLockWidget extends StatefulWidget {
  const PatternLockWidget({Key key}) : super(key: key);

  @override
  _PatternLockWidgetState createState() => _PatternLockWidgetState();
}

class _PatternLockWidgetState extends State<PatternLockWidget> {
  List<int> pattern;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'This is demo of "Pattern Lock" Flutter library',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 4),
          InkWell(
            child: Text(
              'https://github.com/qwert2603/pattern_lock',
              style: TextStyle(fontSize: 16, color: Colors.deepOrange),
            ),
            onTap: () {},
          ),
          SizedBox(height: 4),
          InkWell(
            child: Text(
              'https://pub.dev/packages/pattern_lock',
              style: TextStyle(fontSize: 16, color: Colors.deepOrange),
            ),
            onTap: () {},
          ),
          SizedBox(height: 24),
          MaterialButton(
            color: Colors.lightGreen,
            child: Text("Set Pattern", style: TextStyle(color: Colors.white)),
            onPressed: () async {
              final result = await Navigator.pushNamed(context, "/set_pattern");
              if (result is List<int>) {
                // context.replaceSnackbar(
                //   content: Text("pattern is $result"),
                // );
                setState(() {
                  pattern = result;
                });
              }
            },
          ),
          SizedBox(height: 16),
          MaterialButton(
            color: Colors.green,
            child: Text("Check Pattern", style: TextStyle(color: Colors.white)),
            onPressed: () async {
              final result = await Navigator.pushNamed(
                context,
                "/check_pattern",
                arguments: pattern,
              );
              if (result == true) {
                // context.replaceSnackbar(
                //   content: Text(
                //     "it's correct",
                //     style: TextStyle(color: Colors.green),
                //   ),
                // );
              }
            },
          ),
          SizedBox(height: 24),
          MaterialButton(
            color: Colors.red,
            child: Text("Big Pattern", style: TextStyle(color: Colors.white)),
            onPressed: () => Navigator.pushNamed(context, "/big_pattern"),
          ),
        ],
      ),
    );
  }
}
