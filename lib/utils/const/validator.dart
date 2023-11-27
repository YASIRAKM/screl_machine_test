class MyValidator{
  static String? validateName(String? value){
    if(value!.isEmpty){
      return 'Enter name';
    }
    return null;
  }
  static String? validateEmail(String? value){
    if(value!.isEmpty){
      return 'Enter email';
    }
    if (!value.contains('@')) {
      return 'Incorrect Mail Format';
    }
    return null;
  }
}