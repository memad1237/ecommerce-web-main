import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:responsive_product_web_page/colors.dart';
import 'package:responsive_product_web_page/pages/widgets/image_slider.dart';
import 'package:responsive_product_web_page/ui_helper.dart';

import 'widgets/desktop_appbar.dart';

import 'widgets/mobile_appbar.dart';
import 'widgets/product_options.dart';
import 'widgets/similar_products.dart';

class StaticCamera extends StatefulWidget {
   StaticCamera({super.key, required this.controller});
  final CameraController controller;


  @override
  State<StaticCamera> createState() => _StaticCameraState();
}

class _StaticCameraState extends State<StaticCamera> {

  Future<List<CameraDescription>> getAvailableCameras() async {
    return await availableCameras();
  }

  bool _isDrawerOpened = false;

  final verticalController = ScrollController();
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  late List<CameraDescription> _cameras;

  @override
  initState() {
    super.initState();

    _controller = widget.controller;
    _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
          // Handle access errors here.
            break;
          default:
          // Handle other errors here.
            break;
        }
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    final screenType = context.screenType();
    return Scaffold(
      body: Scrollbar(
        controller: verticalController,
        thumbVisibility: true,
        child: SingleChildScrollView(
            controller: verticalController,
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Visibility(
                    visible: screenType == ScreenType.desktop,
                    replacement: MobileAppBar(
                        onPressed: _isDrawerOpened ? _closeDrawer : _openDrawer,
                        isDrawerOpened: _isDrawerOpened),
                    child: const DesktopAppBar()),
                const SizedBox(
                  height: 50,
                ),
                Flex(
                  direction: screenType == ScreenType.desktop
                      ? Axis.horizontal
                      : Axis.vertical,
                  children: [
                    Visibility(
                      visible: screenType == ScreenType.desktop,
                      child: const Spacer(),
                    ),
                    Expanded(
                      flex: screenType == ScreenType.desktop ? 8 : 0,
                      child: CameraPreview(widget.controller),
                    ),
                    Visibility(
                      visible: screenType == ScreenType.desktop,
                      child: const Spacer(),
                    ),
                    const ProductOptions(),
                    Visibility(
                      visible: screenType == ScreenType.desktop,
                      child: const Spacer(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 73,
                ),
                Text(
                  "Complete Your Experience".toUpperCase(),
                  style: const TextStyle(
                      color: AppColors.black,
                      fontFamily: "Barlow",
                      fontSize: 24,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SimilarProducts(),
                const SizedBox(
                  height: 10,
                ),
              ],
            )),
      ),
    );
  }

  void _openDrawer() {
    setState(() {
      _isDrawerOpened = true;
    });
  }

  void _closeDrawer() {
    setState(() {
      _isDrawerOpened = false;
    });
  }
}
