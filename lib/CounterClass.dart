// ignore_for_file: file_names

class Counter {
  
  int correctAnswer = 0;
  int wrongAnswer = 0;

  incrementCo() => correctAnswer++;
  incrementWr() => wrongAnswer++;
  reset() {
    correctAnswer = 0;
    wrongAnswer = 0;
  }
}