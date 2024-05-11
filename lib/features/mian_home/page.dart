import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';
import 'form.dart';

class MainProvider extends StatelessWidget {
  final bool? isConsultant;
  const MainProvider({super.key, this.isConsultant});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationBloc(),
      child: MainScreenPage(isConsultant: isConsultant?? false),
    );
  }
}
