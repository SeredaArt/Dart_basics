void main() {

  final first = User('user@mail.ru');
  //print(first.email);
  final admin  = AdminUser('admin@mail.ru');
  //print(admin.getMailSystem());
  final generalUser = GeneralUser('generic@yandex.ru');
  //print(generalUser.email);

  final userManager = UserManager();
  userManager.add(first);
  userManager.add(admin);
  userManager.add(generalUser);

  userManager.usersMails();

  userManager.del(first);
  userManager.usersMails();
}

class User{
  final String email;

  User(this.email);
}

class AdminUser extends User with MailSystem{

  AdminUser(String email) : super(email);

}

class GeneralUser extends User{

  GeneralUser(String email) : super(email);

}

mixin MailSystem on User {
  String getMailSystem(){
    return email.split('@')[1];
  }
}

class UserManager<T extends User>{

  List <T> users = [];

  void add(T){
    users.add(T);
  }

  void del(T){
    users.remove(T);
  }

  void usersMails() {

    for (var elements in users) {
      if (elements is AdminUser) {
        print(elements.getMailSystem());
      }
      else {
        print(elements.email);
      }
    }
  }
}