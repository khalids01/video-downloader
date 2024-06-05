import "dart:ui";

import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:video_downloader/src/components/sections/nav.dart";
import "package:video_downloader/src/constants/images.dart";

class BackgroundImageWidget extends StatelessWidget {
  const BackgroundImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const BgImage();
  }
}

class BgImage extends StatelessWidget {
  const BgImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Images.splashbg),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          color: Colors.black.withOpacity(0.3),
        ),
      ),
    );
  }
}

class RootLayout extends ConsumerWidget {
  final Widget child;
  final String? title;

  const RootLayout({super.key, this.title, required this.child});

  @override
  Widget build(BuildContext context, ref) {
    return SafeArea(
      child: Stack(
        fit: StackFit.loose,
        children: [const BackgroundImageWidget(), child],
      ),
    );
  }
}

class Wrapper extends StatelessWidget {
  const Wrapper({
    super.key,
    required this.child,
    this.appBar,
    this.floatingActionButton,
    this.drawer,
    this.endDrawer,
    this.bottomNavigationBar = const Nav(),
    this.backgroundColor = Colors.transparent,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
  });

  final Widget child;
  final AppBar? appBar; // Optional AppBar
  final FloatingActionButton?
      floatingActionButton; // Optional FloatingActionButton
  final Drawer? drawer; // Optional Drawer
  final Drawer? endDrawer; // Optional End Drawer
  final Widget? bottomNavigationBar; // Optional Bottom Navigation Bar
  final Color? backgroundColor; // Background color
  final bool extendBody; // Extend body behind app bar
  final bool extendBodyBehindAppBar; // Extend body behind navigation bar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? Colors.transparent,
      appBar: appBar,
      floatingActionButton: floatingActionButton,
      drawer: drawer,
      endDrawer: endDrawer,
      bottomNavigationBar: bottomNavigationBar ?? const Nav(),
      extendBody: extendBody,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      body: child,
    );
  }
}
