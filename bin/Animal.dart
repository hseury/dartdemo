import 'dart:developer';

class Animal{

  final int eyesNumber = 2;

  static const int feetNumber = 4;

  final earsNumber = 2;

  static const legsNumber = 2;

  /**
   * 私有变量
   */
  String _name = "animal's name";

  String getName(){
    return _name;
  }

  /**
   * 公有变量
   */
  String nickName = "animal's nick name";
}