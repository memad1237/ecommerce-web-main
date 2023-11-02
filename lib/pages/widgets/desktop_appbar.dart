import 'package:flutter/material.dart';
import 'package:responsive_product_web_page/colors.dart';
import 'package:responsive_product_web_page/pages/widgets/search_bar.dart';

import 'app_logo.dart';

class DesktopAppBar extends StatelessWidget {
  const DesktopAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final remainingWidth = MediaQuery.of(context).size.width - 611;
    const viewsCounts = 5;
    final numberOfVisibleViews = (remainingWidth ~/ 120).clamp(0, viewsCounts);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 9),
      child: Row(
        children: [
          const AppLogo(),
          const Spacer(
            flex: 6,
          ),
          ...[
             Text("NTA Academy",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
             SizedBox(
               width: 20,
             ),
             Text("AI Team",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
              SizedBox(
                width: 20,
              ),
             Text("."),
          ].sublist(0, numberOfVisibleViews),
          const Spacer(
            flex: 6,
          ),
        ],
      ),
    );
  }
}
