import 'package:flutter/material.dart';

class ViewBusDetail extends StatelessWidget {
  const ViewBusDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Bus Detail'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                    ),
                    child: Image.network(
                        'https://placeimg.com/640/480/any',
                        // width: 300,
                        height: 150,
                        fit:BoxFit.fill

                    ),
                  ),
                  const ListTile(
                    title: Text('Pub 1'),
                    subtitle: Text('Location 1'),
                  ),
                  const Text("No of seat"),
                ],
              ),
        ),
      ),
    );
  }
}
