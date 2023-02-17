import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  SearchPage(this.query, this.callback, {Key? key}) : super(key: key);
  final String query;
  final void Function(bool) callback;
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(query ?? ""),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                filled: true,
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                callback(true);
                context.router.pop(_controller.text);
                // Navigator.of(context).pop(_controller.text);
              },
              child: Text("Go Back"),
            ),
          ],
        ),
      ),
    );
  }
}
