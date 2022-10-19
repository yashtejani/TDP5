import 'package:flutter/material.dart';
import 'package:project/core/res/color.dart';

class WidgetButton extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final title;
  // ignore: prefer_typing_uninitialized_variables
  final MaterialColor color;
  final IconData icon;
  final Widget screen;
  final void Function()? onTap;
  const WidgetButton({
    super.key,
    required this.title,
    required this.color,
    required this.icon,
    required this.screen,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
              color: color[400],
              boxShadow: [
          BoxShadow(
          color: color.withOpacity(0.4),
          blurRadius: 10,
          spreadRadius: 4,
          offset: const Offset(2, 6),
        )
          ],
            gradient: AppColors.getDarkLinearGradient(color),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                  ],
                ),
                 Icon(
                  icon,
                  color: Colors.white,
                  size: 40,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
