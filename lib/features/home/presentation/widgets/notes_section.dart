import 'package:flutter/material.dart';
import 'package:retailpi/core/widgets/padded_container.dart';

class NotesSection extends StatelessWidget {
  const NotesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedContainer(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Notes and Tasks',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text('View ->'),
                    style: TextButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.primary,
                    )),
              ],
            ),
            Card.filled(
              child: ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Task ${index + 1}'),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Theme.of(context).colorScheme.primary,
                  );
                },
              ),
            ),
          ]),
    );
  }
}
