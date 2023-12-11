import 'package:flutter/material.dart';
import 'package:video_exercice/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'video',
      home: 
      //VertissementPage(),
      HomePrincipale(),
    );
  }
}

class VertissementPage extends StatefulWidget {
  const VertissementPage({super.key});

  @override
  State<VertissementPage> createState() => _VertissementPageState();
}

class _VertissementPageState extends State<VertissementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      body: Center(
        child: SimpleDialog(
          title: const Text(
            "Hop hop hop !",
            style: TextStyle(
                fontSize: 24, color: Colors.pink, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          children: [
            const Text(
              "Ce Site 4444",
              style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return const HomePrincipale();
                      }));
                    });
                  },
                  child: const Text(
                    "MAjeur",
                    style: TextStyle(fontSize: 20, color: Colors.pink),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
