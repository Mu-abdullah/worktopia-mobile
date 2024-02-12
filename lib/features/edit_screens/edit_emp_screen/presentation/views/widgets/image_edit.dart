import 'package:flutter/material.dart';

import '../../../../../../core/utils/asset_data.dart';
import '../../../../../../core/utils/colors.dart';

class EditEmpImage extends StatelessWidget {
  const EditEmpImage({
    super.key,
    required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      maxRadius: 105,
      minRadius: 99,
      backgroundColor: AppColor.babyBlueColor,
      child: Stack(
        children: [
          CircleAvatar(
            minRadius: 100,
            maxRadius: 100,
            child: image.isEmpty
                ? Image.asset(AssetDate.user)
                : Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                          image,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
          ),
          // Positioned(
          //   bottom: 0,
          //   right: 5,
          //   child: CircleAvatar(
          //     maxRadius: 25,
          //     minRadius: 25,
          //     backgroundColor: AppColor.whiteColor,
          //     child: Center(
          //       child: IconButton(
          //         onPressed: () {
          //           // cubit.getImage();
          //         },
          //         icon: const Icon(
          //           Iconsax.add_circle5,
          //           size: 35,
          //         ),
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
