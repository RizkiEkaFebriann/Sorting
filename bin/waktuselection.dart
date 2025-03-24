import 'dart:math';

void selectionSort<T extends Comparable<T>>(List<T> arr) {
  for (int i = 0; i < arr.length - 1; i++) {
    int minIndex = i;
    
    for (int j = i + 1; j < arr.length; j++) {
      if (arr[j].compareTo(arr[minIndex]) < 0) {
        minIndex = j;
      }
    }
    
    if (minIndex != i) {
      T temp = arr[i];
      arr[i] = arr[minIndex];
      arr[minIndex] = temp;
    }
  }
}

List<num> generateRandomData(int size) {
  Random random = Random();
  return List<num>.generate(size, (index) => random.nextInt(150000));
}

void main() {
  List<int> dataSizes = [150000];
  Map<String, List<int>> results = {
    'Selection Sort': []
  };

  for (int size in dataSizes) {
    List<num> data = generateRandomData(size);
    
    List<num> selectionData = List<num>.from(data);
    DateTime start = DateTime.now();
    selectionSort(selectionData);
    Duration elapsed = DateTime.now().difference(start);
    results['Selection Sort']!.add(elapsed.inMilliseconds);
  }
  
  print('Hasil Waktu Running (ms):');
  for (var entry in results.entries) {
    print('${entry.key}: ${entry.value}');
  }
}