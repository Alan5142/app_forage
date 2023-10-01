import 'package:app_forage/pages/create_forage.dart';
import 'package:app_forage/pages/view_forage.dart';
import 'package:app_forage/provider/forage_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forage'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal[300],
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CreateForagePage(),
            ),
          );
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: ListView.builder(
        itemCount: context.watch<ForageProvider>().forages.length,
        itemBuilder: (context, index) {
          var forage = context.read<ForageProvider>().forages[index];
          return InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      ViewForagePage(index: index, forage: forage),
                ),
              );
            },
            child: ListTile(
              title: Text(
                forage.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(forage.location),
            ),
          );
        },
      ),
    );
  }
}
