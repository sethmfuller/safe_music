import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ConnectionTile extends StatelessWidget {
  final Color color;
  final String imagePath;
  final String title;
  final Function() onConnectClick;

  const ConnectionTile(
      this.color, this.imagePath, this.title, this.onConnectClick,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                  width: 80,
                  child: Container(
                    decoration: const BoxDecoration(),
                    child: Image.asset(imagePath),
                  ),
                ),
                const Gap(10),
                Text(
                  title,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const Gap(40),
                OutlinedButton(
                  onPressed: onConnectClick,
                  style: const ButtonStyle(
                    textStyle: WidgetStatePropertyAll<TextStyle?>(
                      TextStyle(fontWeight: FontWeight.bold),
                    ),
                    foregroundColor:
                        WidgetStatePropertyAll<Color?>(Colors.white),
                    side: WidgetStatePropertyAll<BorderSide?>(
                      BorderSide(color: Colors.white),
                    ),
                  ),
                  child: const Text('Connect'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
