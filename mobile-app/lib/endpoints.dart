class Endpoints{

  static const  String domain = 'http://10.0.2.2:5000/api/';
  static const  String hospital = domain+'Hospitals';
  static const String users = domain+'Users';
  static const String employees = domain+'Employees';
  static const String login = users+'/login';
  static const String register = users+'/register';

}