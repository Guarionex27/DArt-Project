

  class Library {
    String _name;
    String _books;
    int _maxcapacity;

    // constructeur principal
    Library(this._name, this._books, this._maxcapacity);

    // constructeur nommé
    Library.empty(this._name, this._books, this._maxcapacity);

    // getters
    String get name => _name;
    String get books => _books;
    int get maxcapacity => _maxcapacity;

    // getter calcul
    String get mention {
      if (_maxcapacity > 250) return 'is full';
      if (_maxcapacity >= 200) return 'add book';
      if (_maxcapacity < 100) return 'remove book';
      return 'list book';
          }

    // setter
    set maxcapacity(int v) {
      if (v < 0 || v > 450) {
        print('ce livre doit appartenir au rayon grand ouvrage');
        return;
      }
      _maxcapacity = v;
    }
  }
void main() {
  var livre= Library(" Section_c"," match",150);
  print(livre.name);
  print(livre.books);
  print(livre.maxcapacity);
print(livre.mention);


}