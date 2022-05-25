main(){
  checkVersion();
  print('End process');
}

Future checkVersion() async{ // 비동기 함수
  var version = await lookupVersion(); // await: 끝나면 출력
  print(version);
}

int lookupVersion(){
  return 12;
}