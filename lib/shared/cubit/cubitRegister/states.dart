abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {

}

class RegisterErrorState extends RegisterStates {
  final String error;
  RegisterErrorState(this.error);
}

class RegisterCreateUserLoadingState extends RegisterStates {}

class RegisterCreateUserSuccessState extends RegisterStates {

}

class RegisterCreateUserErrorState extends RegisterStates {
  final String error;
  RegisterCreateUserErrorState(this.error);
}

class ChangePasswordRegVisibilityState extends RegisterStates {}
