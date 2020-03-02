#include <iostream>
#include <string>

using namespace std;
const int wordNum = 10;


void swap(string &a, string &b){
	string tmp = a;
	a = b;
	b = tmp;
}	

				

string toLower(string str){
	char s[str.length()];
	for (int i=0;i<str.length();i++){
		s[i] = str[i] + ((str[i]>'Z') ? 0 : ('a'-'A')); 
	}
	return s;
}


struct alpha_lib{
	public:
		void initialize(){
			for (int i = 0; i < 26; i++){
				alphabet_length[i] = 0;
			}
			for (int i = 0; i < 26; i++){
				for (int j = 0; j < 10; j++){
			//		char str[2] = {static_cast<char>(i + 'A'), 'z', '\0'};
					alphabet_array[i][j] = "";
				}
			}
		}
		void print(){
			cout << "Lib alphabet array" << endl;
			for (int i = 0; i < 26; ++i){
				cout << (char)(i+'A') << ": ";
				for (const auto& x: alphabet_array[i]){
					if (!x.empty())
						cout << x << ", ";
				}
				cout << endl;
			}

		}

		string* get_array(){
			static string sorted_array[10];
			for (int i=0,index=0; i<26; i++){
				for (int j = 0; j < 10; j++){
					if (alphabet_array[i][j].empty())
						break;
					sorted_array[index++] = alphabet_array[i][j];
				}
			}
			return sorted_array;
		}

		void set_array(string word){
			alphabet_array[tolower(word[0])-'a'][alphabet_length[tolower(word[0])-'a']++] = word;
		}

		bool not_sorted(int letter) const{
			for (int i = 0; i < alphabet_length[letter]; i++){
				if (alphabet_array[letter][i] > alphabet_array[i][i+1])
					return true;
			}
			return false;
		}

		bool compare(string a, char op, string b) const{
			switch (op){
				case '<':
					if (toLower(a) < toLower(b))
						return true;
					return false;
				case '>':
					if (toLower(a) > toLower(b))
						return true;
					return false;
				case '=':
					if (toLower(a) == toLower(b))
						return true;
					return false;

			}

			return false;
		}

		void sort();
	private:
		string alphabet_array[26][10];
		int alphabet_length[26];
};

void alpha_lib::sort(){
	for (int i=0; i < 26; i++){
		for (int j=0; !alphabet_array[i][j].empty(); j++){
			//Some premature optimizations, probably remove them later
			if (alphabet_array[i][0].empty() || alphabet_array[i][1].empty()) continue;
			if (alphabet_array[i][2].empty()) {
				if (compare(alphabet_array[i][0], '>', alphabet_array[i][1]))
					swap(alphabet_array[i][0], alphabet_array[i][1]);
				continue;
			};

			//
			while (not_sorted(i)){
				for (int k = 0; k < alphabet_length[i]; k++){
					if (compare(alphabet_array[i][k], '>', alphabet_array[i][k+1])){
						swap(alphabet_array[i][k], alphabet_array[i][k+1]);	
					}
				}
			}
		}
	}
}


void SortingWords(string* words){
	alpha_lib lib;
	lib.initialize();


	for (int i = 0; i < 10; i++)
		lib.set_array(words[i]);

	lib.sort();
	lib.print();

	string* sorted_array = lib.get_array();
	for (int i = 0; i < 10; i++)
		words[i] = sorted_array[i];
}

int main(){
	string words[wordNum] = {"Java", "Apple", "JVM", "word", "HELLO", "headphones", "eggs", "BOAT", "Banana", "Grape"};
	string correct[wordNum] = {"Apple", "Banana", "BOAT", "eggs", "Grape", "headphones", "HELLO", "Java", "JVM", "word"};
	cout << "Sorting..." << endl;

	SortingWords(words);

	cout << "Complete!" << endl;


	for (string i : words)
		cout << i << endl;

	for (int i = 0; i < wordNum; i++){
		if (words[i] != correct[i]){
			cout << words[i] << ' ' << correct[i] << endl;
			cout << "Not the same!" << endl;
			return 0;
		}
	}


}