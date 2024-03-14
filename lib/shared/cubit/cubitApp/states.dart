abstract class AppStates {}

class InitialState extends AppStates {}

class GetUserLoadingState extends AppStates {}

class GetUserSuccessState extends AppStates {}

class GetUserErrorState extends AppStates {
  final String error;
  GetUserErrorState(this.error);
}

class ChangeBottomNavState extends AppStates {}

class NewPostState extends AppStates {}

class ProfileImagePickedSuccessState extends AppStates {}

class ProfileImagePickedErrorState extends AppStates {}

class CoverImagePickedSuccessState extends AppStates {}

class CoverImagePickedErrorState extends AppStates {}

class ProfileUploadImageSuccessState extends AppStates {}

class ProfileUploadImageErrorState extends AppStates {}

class CoverUploadImageSuccessState extends AppStates {}

class CoverUploadImageErrorState extends AppStates {}

class UserUpdateLoadingState extends AppStates {}

class UserUpdateErrorState extends AppStates {}