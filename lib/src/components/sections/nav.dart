import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:video_downloader/src/constants/routes.dart';

class Nav extends StatelessWidget {
  const Nav({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: const BorderRadius.all(
          Radius.circular(100),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Suggested code may be subject to a license. Learn more: ~LicenseLog:2471427116.
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              size: 25,
            ),
          ),
          IconButton(
            onPressed: () {
              context.go(Endpoints.home);
            },
            icon: const Icon(
              Icons.home,
              size: 25,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.download,
              size: 25,
            ),
          ),
        ],
      ),
    );
  }
}
