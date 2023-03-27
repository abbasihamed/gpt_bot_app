import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:talk_with_bot/presentations/components/app_loading.dart';

class MessagesCard extends StatelessWidget {
  final String? message;
  final String? date;
  final String? sender;
  final bool isLoading;
  const MessagesCard({
    Key? key,
    this.message,
    this.date,
    this.sender,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
      child: Align(
        alignment:
            sender == 'bot' ? Alignment.centerLeft : Alignment.centerRight,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
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
                    ? theme.colorScheme.onSecondaryContainer
                    : theme.colorScheme.onPrimaryContainer,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: isLoading
                      ? const AppLoading()
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: Text(
                                '$message',
                                style: theme.textTheme.bodyMedium,
                              ),
                            ),
                            Text(
                              ' $date',
                              style: theme.textTheme.labelSmall,
                            )
                          ],
                        ),
                ),
              ),
            ),
            if (sender == 'bot' && !isLoading)
              SizedBox(
                width: 50,
                child: IconButton(
                  onPressed: () async {
                    await Clipboard.setData(ClipboardData(text: message));
                  },
                  icon: const Icon(
                    Icons.copy,
                    size: 20,
                    color: Colors.grey,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
