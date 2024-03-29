abstract class AppStates {}

class InitialState extends AppStates {}

class GetUserLoadingState extends AppStates {}

class GetUserSuccessState extends AppStates {}

class GetUserErrorState extends AppStates {
  final String error;
  GetUserErrorState(this.error);
}

class GetAllUserLoadingState extends AppStates {}

class GetAllUserSuccessState extends AppStates {}

class GetAllUserErrorState extends AppStates {
  final String error;
  GetAllUserErrorState(this.error);
}

// class GetPostsLoadingState extends AppStates {}

class GetPostsSuccessState extends AppStates {}

class GetPostsErrorState extends AppStates {
  final String error;
  GetPostsErrorState(this.error);
}

class LikePostSuccessState extends AppStates {}

class LikePostErrorState extends AppStates {
  final String error;
  LikePostErrorState(this.error);
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

//  chats
class SendMessageSuccessState extends AppStates {}

class SendMessageErrorState extends AppStates {
  final String error;
  SendMessageErrorState(this.error);
}

class GetMessageSuccessState extends AppStates {}

// class GetMessageErrorState extends AppStates {
//   final String error;
//   GetMessageErrorState(this.error);
// }
