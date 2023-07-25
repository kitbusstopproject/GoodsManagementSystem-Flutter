import 'package:flutter/material.dart';

class ActionCard extends StatelessWidget {
  final String actionName;
  const ActionCard({super.key, required this.actionName});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 0,
        color: Theme.of(context).colorScheme.surfaceVariant,
        child: SizedBox(height: 100, child: Center(child: Text(actionName))),
      ),
    );
  }
}
