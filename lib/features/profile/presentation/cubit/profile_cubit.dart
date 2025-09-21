import 'package:flutter_bloc/flutter_bloc.dart';

import 'profile_states.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitialState());
  static ProfileCubit get(context) => BlocProvider.of(context);
}
