import 'package:app_forage/provider/create_forage_provider.dart';
import 'package:app_forage/provider/forage_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateForagePage extends StatelessWidget {
  int? index;
  CreateForagePage({super.key, this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forage'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            TextFormField(
              // Filled text field
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
              controller: context.read<CreateForageProvider>().nameController,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child: TextFormField(
                // Filled text field
                decoration: const InputDecoration(
                  labelText: 'Location',
                  border: OutlineInputBorder(),
                ),
                controller:
                    context.read<CreateForageProvider>().locationController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                      activeColor: Colors.teal[300],
                      value: context
                          .watch<CreateForageProvider>()
                          .currentlyInSeason,
                      onChanged: (value) {
                        context
                            .read<CreateForageProvider>()
                            .setCurrentlyInSeason(value!);
                      }),
                  const Text('Currently in season'),
                ],
              ),
            ),
            TextFormField(
              // Filled text field
              decoration: const InputDecoration(
                labelText: 'Notes',
                border: OutlineInputBorder(),
              ),
              controller: context.read<CreateForageProvider>().notesController,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      var forage =
                          context.read<CreateForageProvider>().createForage();

                      if (context.read<CreateForageProvider>().editMode) {
                        context
                            .read<ForageProvider>()
                            .updateForage(forage, index!);
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            const SnackBar(
                              content: Text('Forage edited'),
                            ),
                          );
                      } else {
                        context.read<ForageProvider>().addForage(forage);
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            const SnackBar(
                              content: Text('Forage created'),
                            ),
                          );
                      }
                    },
                    child: const Text('SAVE'),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<CreateForageProvider>().clearTextFields();
                    },
                    child: const Text('DELETE'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
