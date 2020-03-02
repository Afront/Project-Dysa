#include <iostream>
using namespace std;
const int INT_MAX = 32767; 
const int INT_MIN = -32767;

const int SIZE = 10;



void printArr(int arr[], int length){
	cout << arr[0];
	for (int i = 1; i < length; i++){
		 cout << " " << arr[i];
	}
	cout << endl;
}



int main(){
	int arr[SIZE] = {5, 13, 6, 1, 32, 65, 87, 23, 14, 88};
	cout << "Before sort: " << endl;
	printArr(arr, SIZE);
	cout << "Sorted (descending order): " << endl;

	int new_arr[SIZE];
	int length = SIZE;

	int check[SIZE];
	for (int i = 0; i < length; i++){
		check[i] = 0;
		new_arr[i] = 0;
	}
	
	int min = 0;
	int max = 0;

	for (int i = 0; i < length; i++){
		if (arr[i] < arr[min]){
			min = i;
		}
		if (arr[i] > arr[max]){
			max = i;
		}
	}


	for (int i = 0; i < length/2; i++){
		int min_i = max; int max_i = min;
		for (int j = 0; j < length; j++){
			if (check[j] == 1) continue;
			if (arr[min_i] > arr[j]){
				min_i = j;
		}
			if (arr[max_i] < arr[j]){
				max_i = j;
			}
		}		
		new_arr[i] = arr[min_i];
		check[min_i] = 1;
		check[max_i] = 1;
		new_arr[length-1-i] = arr[max_i];
	}

	cout << new_arr[length-1];
	for (int i = length-2; i>= 0 ; i--){
		 cout << " " << new_arr[i];
	}
	cout << endl;
	
	cout << "Sorted (ascending order): " << endl;
	printArr(new_arr, SIZE);
	
}