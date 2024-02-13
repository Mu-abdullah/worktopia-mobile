import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../core/utils/asset_data.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../new_emp/presentation/manger/new_emp_cubit/new_emp_cubit.dart';

class EmpImage extends StatelessWidget {
  const EmpImage({
    super.key,
    required this.cubit,
  });

  final NewEmpCubit cubit;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      maxRadius: 105,
      minRadius: 99,
      backgroundColor: AppColor.babyBlueColor,
      child: Stack(
        children: [
          SizedBox(
            child: kIsWeb ? webPicked() : androidPicked(),
          ),
          Positioned(
            bottom: 0,
            right: 5,
            child: CircleAvatar(
              maxRadius: 25,
              minRadius: 25,
              backgroundColor: AppColor.whiteColor,
              child: Center(
                child: IconButton(
                  onPressed: () {
                    cubit.whichPaltform();
                  },
                  icon: const Icon(
                    kIsWeb ? Icons.add : Iconsax.add_circle5,
                    size: 35,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  CircleAvatar androidPicked() {
    return CircleAvatar(
      minRadius: 100,
      maxRadius: 100,
      child: cubit.image == null
          ? Image.asset(AssetDate.user)
          : Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: FileImage(cubit.image!), //FileImage(cubit.image!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
    );
  }

  CircleAvatar webPicked() {
    return CircleAvatar(
      minRadius: 100,
      maxRadius: 100,
      child: cubit.pickedBytes == null
          ? Image.asset(AssetDate.user)
          : Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: MemoryImage(
                      cubit.pickedBytes!), //FileImage(cubit.image!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
    );
  }
}
