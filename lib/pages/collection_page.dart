import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:responsive_product_web_page/colors.dart';
import 'package:responsive_product_web_page/pages/widgets/image_slider.dart';
import 'package:responsive_product_web_page/ui_helper.dart';

import 'widgets/desktop_appbar.dart';

import 'widgets/mobile_appbar.dart';
import 'widgets/product_options.dart';
import 'widgets/similar_products.dart';

class CollectionsPage extends StatefulWidget {
   CollectionsPage({super.key, required this.controller});
  final CameraController controller;


  @override
  State<CollectionsPage> createState() => _CollectionsPageState();
}

class _CollectionsPageState extends State<CollectionsPage> {
  bool _isDrawerOpened = false;

  final verticalController = ScrollController();


  Future<List<CameraDescription>> getAvailableCameras() async {
    return await availableCameras();
  }


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
      drawer: screenType == ScreenType.mobile ? const Drawer() : null,
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
                        child: Card(
                            elevation: 100,
                            child: Stack(
                              children: [
                                CameraPreview(widget.controller),

                              ],
                            ))),
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
