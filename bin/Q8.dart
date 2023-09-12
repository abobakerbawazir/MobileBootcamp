
import 'dart:io';//to use handle files

void main() {
  try {//to handel execption
    File f = new File("data.txt");//to use class File from dart.io to handle file data.txt   
    List<String> words = f.readAsStringSync().split(' ');// use readAsStringSync() to read the file data.txt

    // and use split(' ') to split the text into words using ' '(space)
    // //print(words);
    String longword = '';//to store value because we will use for loop
    for (String word in words) {
      //print(word);
      if (word.length >= longword.length) {//i am use word.length >= longword.length becuse word&longword is string
      //how do i compare string ,iam use word.length&longword.length tp make a lenght comparsion for word
        longword = word;//since perform loop through all word and condition is met
      }
    }
    print("the length word is $longword");
  } catch (e) {
    print(e);//print message exeption
  }
}
