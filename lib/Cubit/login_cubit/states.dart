

abstract class LoginStates {}

class   SocialInitialLoginState extends LoginStates{}

class   SocialLoginLoadingState extends LoginStates{}

class   SocialLoginSuccessState extends LoginStates
{
  late final String uId;

  SocialLoginSuccessState(this.uId);
}

class   SocialLoginErrorState extends LoginStates
{
  late final String error;

  SocialLoginErrorState(this.error);

}
class   SocialChangePasswordState extends LoginStates{}
