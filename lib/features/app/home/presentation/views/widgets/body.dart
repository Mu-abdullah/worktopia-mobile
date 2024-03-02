import 'package:flutter/material.dart';

import 'new_home_listview.dart';

class NewHomeBody extends StatelessWidget {
  const NewHomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: NewHomeListView(),
    );
  }
}
