abstract class AppStates {}

class InitialState extends AppStates {}

class GetUserLoadingState extends AppStates {}

class GetUserSuccessState extends AppStates {}

class GetUserErrorState extends AppStates {
  final String error;
  GetUserErrorState(this.error);
}

class GetPostsLoadingState extends AppStates {}

class GetPostsSuccessState extends AppStates {}

class GetPostsErrorState extends AppStates {
  final String error;
  GetPostsErrorState(this.error);
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

// create post
class CreatePostLoadingState extends AppStates {}

class CreatePostSuccessState extends AppStates {}

class CreatePostErrorState extends AppStates {}

class PostImagePickedSuccessState extends AppStates {}

class PostImagePickedErrorState extends AppStates {}

class RemovePostImageState extends AppStates {}
