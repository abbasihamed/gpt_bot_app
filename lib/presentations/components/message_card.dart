import 'package:flutter/material.dart';
import 'package:talk_with_bot/utils/theme.dart';

class MessagesCard extends StatelessWidget {
  final String message;
  final String date;
  final String sender;
  const MessagesCard({
    Key? key,
    required this.message,
    required this.date,
    required this.sender,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
      child: Align(
        alignment:
            sender == 'bot' ? Alignment.centerLeft : Alignment.centerRight,
        child: Material(
          borderRadius: sender == 'bot'
              ? const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                )
              : const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
          elevation: 2,
          color: sender == 'bot'
              ? theme(context).colorScheme.onSecondaryContainer
              : theme(context).colorScheme.onPrimaryContainer,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    message,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
                Text(
                  ' $date',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
