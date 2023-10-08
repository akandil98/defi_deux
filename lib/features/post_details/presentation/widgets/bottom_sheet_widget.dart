import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            width: 0.8.sw,
            height: 0.05.sh,
            child: TextFormField(
              decoration: InputDecoration(
                fillColor: const Color.fromARGB(255, 26, 26, 26),
                filled: true,
                hintText: 'Add a comment',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromARGB(255, 26, 26, 26),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.keyboard_arrow_down),
          ),
        )
      ],
    );
  }
}
