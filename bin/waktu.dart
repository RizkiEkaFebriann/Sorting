import 'dart:math';

// Bubble Sort
void bubbleSort<T extends Comparable<T>>(List<T> arr) {
  int n = arr.length;
  for (int i = 0; i < n - 1; i++) {
    for (int j = 0; j < n - i - 1; j++) {
      if (arr[j].compareTo(arr[j + 1]) > 0) {
        T temp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = temp;
      }
    }
  }
}

List<num> generateRandomData(int size) {
  Random random = Random();
  return List<num>.generate(size, (index) => random.nextInt(100000));
}

void main() {
  List<int> dataSizes = [150000];
  Map<String, List<int>> results = {
    'Bubble Sort': []
  };

  for (int size in dataSizes) {
    List<num> data = generateRandomData(size);

    // Bubble Sort
    List<num> bubbleData = List<num>.from(data);
    DateTime startBubble = DateTime.now();
    bubbleSort(bubbleData);
    Duration elapsedBubble = DateTime.now().difference(startBubble);
    results['Bubble Sort']!.add(elapsedBubble.inMilliseconds);
  }
   print('Hasil Waktu Running (ms):');
  for (var entry in results.entries) {
    print('${entry.key}: ${entry.value}');
  }
}