import 'dart:math';

void quickSort<T extends Comparable<T>>(List<T> arr, int low, int high) {
  if (low < high) {
    int pi = partition(arr, low, high);
    quickSort(arr, low, pi - 1);
    quickSort(arr, pi + 1, high);
  }
}

int partition<T extends Comparable<T>>(List<T> arr, int low, int high) {
  T pivot = arr[high];
  int i = low - 1;
  for (int j = low; j < high; j++) {
    if (arr[j].compareTo(pivot) < 0) {
      i++;
      T temp = arr[i];
      arr[i] = arr[j];
      arr[j] = temp;
    }
  }
  T temp = arr[i + 1];
  arr[i + 1] = arr[high];
  arr[high] = temp;
  return i + 1;
}

List<num> generateRandomData(int size) {
  Random random = Random();
  return List<num>.generate(size, (index) => random.nextInt(100000));
}

void main() {
  List<int> dataSizes = [100000];
  Map<String, List<int>> results = {
    'Bubble Sort': []
  };

   for (int size in dataSizes) {
    List<num> data = generateRandomData(size);

    List<num> quickData = List<num>.from(data);
    DateTime startQuick = DateTime.now();
    quickSort(quickData, 0, quickData.length - 1);
    Duration elapsedQuick = DateTime.now().difference(startQuick);
    results['Quick Sort']!.add(elapsedQuick.inMilliseconds);
   }

     print('Hasil Waktu Running (ms):');
  for (var entry in results.entries) {
    print('${entry.key}: ${entry.value}');
  }
}