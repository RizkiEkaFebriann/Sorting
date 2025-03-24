import 'dart:math';

void insertionSort<T extends Comparable<T>>(List<T> arr) {
  for (int i = 1; i < arr.length; i++) {
    T key = arr[i];
    int j = i - 1;
    
    while (j >= 0 && arr[j].compareTo(key) > 0) {
      arr[j + 1] = arr[j];
      j = j - 1;
    }
    arr[j + 1] = key;
  }
}

List<num> generateRandomData(int size) {
  Random random = Random();
  return List<num>.generate(size, (index) => random.nextInt(200000));
}

void main() {
  List<int> dataSizes = [200000];
  Map<String, List<int>> results = {
    'Insertion Sort': []
  };

  for (int size in dataSizes) {
    List<num> data = generateRandomData(size);
    
    List<num> insertionData = List<num>.from(data);
    DateTime startInsertion = DateTime.now();
    insertionSort(insertionData);
    Duration elapsedInsertion = DateTime.now().difference(startInsertion);
    results['Insertion Sort']!.add(elapsedInsertion.inMilliseconds);
  }
  
  print('Hasil Waktu Running (ms):');
  for (var entry in results.entries) {
    print('${entry.key}: ${entry.value}');
  }
}