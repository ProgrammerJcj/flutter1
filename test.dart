main(){
  String displayCharacter = '사랑해요';
  String character;
  List str = [];

  str = displayCharacter.split('');
  print(str);
  character = str[0];
  character += str[1];
  character += str[2];
  print(character);
}