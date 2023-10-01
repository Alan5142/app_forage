import 'package:app_forage/models/forage_model.dart';
import 'package:app_forage/pages/create_forage.dart';
import 'package:app_forage/provider/create_forage_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewForagePage extends StatelessWidget {
  final int index;
  final ForageModel forage;
  const ViewForagePage({super.key, required this.index, required this.forage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forage'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CreateForageProvider>().setForage(forage);

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CreateForagePage(index: index),
            ),
          );
        },
        child: const Icon(Icons.edit),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                forage.name,
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.left,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: Text(forage.location),
                    leading: const Icon(Icons.location_on_sharp),
                  ),
                  ListTile(
                    title: Text(forage.currentlyInSeason
                        ? 'Currently in season'
                        : 'Not in season'),
                    leading: const Icon(Icons.calendar_today_rounded),
                  ),
                  ListTile(
                    title: Text(forage.notes),
                    leading: const Icon(Icons.notes),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
