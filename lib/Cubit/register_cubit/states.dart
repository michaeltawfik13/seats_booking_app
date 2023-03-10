

abstract class SocialRegisterStates {}

class   SocialInitialRegisterState extends SocialRegisterStates{}

class   SocialRegisterLoadingState extends SocialRegisterStates{}

class   SocialRegisterSuccessState extends SocialRegisterStates
{}
class    SocialRegisterErrorState extends SocialRegisterStates
{
  late final String error;

  SocialRegisterErrorState(this.error);
}

class   SocialCreateUserSuccessState extends SocialRegisterStates
{}
class    SocialCreateUserErrorState extends SocialRegisterStates
{
  late final String error;

  SocialCreateUserErrorState(this.error);

}
class   SocialRegisterChangePasswordState extends SocialRegisterStates{}
