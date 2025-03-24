import 'dart:math';

void mergeSort<T extends Comparable<T>>(List<T> arr, int l, int r) {
  if (l < r) {
    int m = (l + r) ~/ 2;
    mergeSort(arr, l, m);
    mergeSort(arr, m + 1, r);
    merge(arr, l, m, r);
  }
}

void merge<T extends Comparable<T>>(List<T> arr, int l, int m, int r) {
  int n1 = m - l + 1;
  int n2 = r - m;

  List<T> L = List<T>.generate(n1, (index) => arr[l + index]);
  List<T> R = List<T>.generate(n2, (index) => arr[m + 1 + index]);

  int i = 0, j = 0, k = l;
  while (i < n1 && j < n2) {
    if (L[i].compareTo(R[j]) <= 0) {
      arr[k] = L[i];
      i++;
    } else {
      arr[k] = R[j];
      j++;
    }
    k++;
  }

  while (i < n1) {
    arr[k] = L[i];
    i++;
    k++;
  }

  while (j < n2) {
    arr[k] = R[j];
    j++;
    k++;
  }
}

List<num> generateRandomData(int size) {
  Random random = Random();
  return List<num>.generate(size, (index) => random.nextInt(100000));
}

void main() {
  List<int> dataSizes = [100000];
  Map<String, List<int>> results = {
    'Merge Sort': []
  };

   for (int size in dataSizes) {
    List<num> data = generateRandomData(size);

    List<num> mergeData = List<num>.from(data);
    DateTime startMerge = DateTime.now();
    mergeSort(mergeData, 0, mergeData.length - 1);
    Duration elapsedMerge = DateTime.now().difference(startMerge);
    results['Merge Sort']!.add(elapsedMerge.inMilliseconds);
  }

   print('Hasil Waktu Running (ms):');
  for (var entry in results.entries) {
    print('${entry.key}: ${entry.value}');
  }
}