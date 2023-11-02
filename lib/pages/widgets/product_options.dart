import 'package:flutter/material.dart';
import 'package:responsive_product_web_page/colors.dart';
import 'package:responsive_product_web_page/pages/widgets/product_colors.dart';


class ProductOptions extends StatefulWidget {
  const ProductOptions({super.key});

  @override
  State<ProductOptions> createState() => _ProductOptionsState();
}

class _ProductOptionsState extends State<ProductOptions> {
  int _selectedColorIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 346,
      height: 470,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          alignment: Alignment.center,
          width: 65,
          height: 23,
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.grey),
              borderRadius: BorderRadius.circular(11)),
          child: const Text(
            "NEW",
            style: TextStyle(fontSize: 12),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          "Dynamic Camera".toUpperCase(),
          style: const TextStyle(fontSize: 30, fontFamily: "Barlow"),
        ),
        const SizedBox(
          height: 4,
        ),
        const SizedBox(
          height: 4,
        ),
        const SizedBox(
          height: 8,
        ),
        const SizedBox(
          height: 20,
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: double.infinity,
          height: 58,
          child: ElevatedButton.icon(
            label: const Text(
              "Violance",
              style: TextStyle(
                  fontFamily: "Barlow",
                  letterSpacing: 4.25,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            onPressed: () {},
            icon: const Icon(Icons.model_training),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
            width: double.infinity,
            height: 58,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                      side: const BorderSide(color: AppColors.grey, width: 2)),
                  foregroundColor: AppColors.grey),
              onPressed: () {},
              child: const Text(
                "Count & ROI",
                style: TextStyle(
                    fontFamily: "Barlow",
                    letterSpacing: 4.25,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            )),
      ]),
    );
  }
}
