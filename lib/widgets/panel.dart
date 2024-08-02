import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:safe_music/main.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Panel extends StatelessWidget {
  const Panel({
    super.key,
    required this.connectionDetails,
    required this.controller,
  });

  final ConnectionDetails connectionDetails;
  final PanelController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // background color of panel
        color: connectionDetails.clientColor,
        // rounded corners of panel
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              children: [
                Text(
                  'Connect to ${connectionDetails.clientType}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const Expanded(child: Gap(0)),
                IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    controller.close();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
