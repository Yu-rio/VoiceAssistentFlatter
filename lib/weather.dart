class Weather {
  late String temp;
  late String description;
  late DateTime date;

  Weather(this.temp, this.description, this.date);

  @override
  String toString() {
    return 'Дата: ${date.day}-${date.month}-${date.year}, Температура: $temp°C, Облачность: $description';
  }
}
