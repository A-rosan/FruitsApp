import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('onChange-- ${bloc.runtimeType} $change');
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    log('onCreate-- ${bloc.runtimeType} created');
  }

  void onclose(BlocBase bloc) {
    super.onClose(bloc);
    log('onClose-- ${bloc.runtimeType} closed');
  }
}
