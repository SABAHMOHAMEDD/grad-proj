
abstract class RegisterStates  {}

class RegisterInitialState extends RegisterStates{}

class RegisterProfileImgPickedSuccessState extends RegisterStates{}
class RegisterProfileImgPickedErrorState extends RegisterStates{}

class SocialProfileImgUploadErrorState extends RegisterStates{}

class LoginChangeVisibilityState extends RegisterStates{}


class RegisterLoadingState extends RegisterStates{}


class RegisterSuccessState extends RegisterStates{

}
class RegisterErrorState extends RegisterStates{
final String error;

RegisterErrorState(this.error);

}

class CreateSuccessState extends RegisterStates {
  final String uId;
  CreateSuccessState(this.uId);

}

class CreateErrorState extends RegisterStates{
  final String error;
CreateErrorState(this.error);
}

