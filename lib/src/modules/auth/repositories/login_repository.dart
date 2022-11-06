class LoginRepository{
  Future <bool> login(String email, String password) async {
    if (email == 'flaviojuniorx@yahoo.com.br' && password == '123'){
      return true;
    } else{
      throw Exception('Error no login');
    }
    }
  }
