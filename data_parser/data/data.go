package data

import "github.com/maxnemoy/inventory_stack/data_parser/models"


var PlacesInitData = []models.Place{
	{UUID: "", Name: "Не определено", Description: "Местоположение не известно"},
	{UUID: "", Name: "Математика 1", Description: "3 этаж"},
	{UUID: "", Name: "Математика 2", Description: "3 этаж"},
	{UUID: "", Name: "Математика 3", Description: "3 этаж"},
	{UUID: "", Name: "Математика 5", Description: "3 этаж"},
	{UUID: "", Name: "Математика 6", Description: "3 этаж"},
	{UUID: "", Name: "Русский 1", Description: "3 этаж"},
	{UUID: "", Name: "Русский 2", Description: "3 этаж"},
	{UUID: "", Name: "Русский 3", Description: "3 этаж"},
	{UUID: "", Name: "Русский 4", Description: "3 этаж"},
	{UUID: "", Name: "Русский 5", Description: "3 этаж"},
	{UUID: "", Name: "Русский 6", Description: "2 этаж"},
	{UUID: "", Name: "Русский 7", Description: "3 этаж"},
}

var TypesInitData = []models.ItemType{
	{Name: "Не определен", Icon: "0xf128|0x10f128", Keys: []string{}},
	{Name: "Проектор", Icon: "0xf8d6|0x10f8d6", Keys: []string{"Проектор"}},
	{Name: "Экран для проектора", Icon: "0xf685|0x10f685", Keys: []string{"Экран для проектора", "экран"}},
	{Name: "Шторы", Icon: "0xf734|0x10f734", Keys: []string{"Шторы", "штор", "жалюзи"}},
	{Name: "3D принтер", Icon: "0xf1b3|0x10f1b3", Keys: []string{"3D принтер", "3 D принтер", "3D-принтер", "3D-сканер"}},
	{Name: "МФУ", Icon: "0xf68a|0x10f68a", Keys: []string{"МФУ", "копир", "Многофункциональное устройство", "принтер сканер", "XEROX"}},
	{Name: "Принтер", Icon: "0xf02f|0x10f02f", Keys: []string{"Принтер"}},
	{Name: "Сканер", Icon: "0xf8f3|0x10f8f3", Keys: []string{"Сканер"}},
	{Name: "Набор для робототехники", Icon: "0xf2db|0x10f2db", Keys: []string{"Набор для робототехники", "Робот", "Ардуино", "Амперка", "Mindstorms", "WeDo", "Микрокомпьютер", "NXT", "TETRIX", "Lego"}},
	{Name: "Аудио / Видео", Icon: "0xf87c|0x10f87c", Keys: []string{"Аудио / Видео", "проигр", "радиосис", "музык", "вокал", "Видео", "Микрофон", "Магнит", "Усилитель", "Микшер", "Экволайзер", "Звук", "Электрогитара", "Приставка", "Колонки", "Сабвуфер"}},
	{Name: "Квадрокоптер", Icon: "0xf533|0x10f533", Keys: []string{"Квадрокопт"}},
	{Name: "Мебель", Icon: "0xf4b8|0x10f4b8", Keys: []string{"Мебель", "Мебел", "диван", "отдыха", "Полка", "Стеллаж", "гарнитур", "Стол", "Стул", "Тумба", "Шкаф", "зона"}},
	{Name: "Системный блок", Icon: "0xf37e|0x10f37e", Keys: []string{"Системный блок", "Server", "Систем", "Компьютер", "пк"}},
	{Name: "Ноутбук", Icon: "0xf109|0x10f109", Keys: []string{"Ноутбук"}},
	{Name: "Планшет", Icon: "0xf3fc|0x10f3fc", Keys: []string{"Планшет"}},
	{Name: "Монитор", Icon: "0xf108|0x10f108", Keys: []string{"Монитор"}},
	{Name: "Рециркулятор", Icon: "0xf8f4|0x10f8f4", Keys: []string{"Рециркулятор"}},
	{Name: "Сейф", Icon: "0xf187|0x10f187", Keys: []string{"Сейф"}},
	{Name: "Телевизор", Icon: "0xf26c|0x10f26c", Keys: []string{"Телевизор", "ТВ", "Плазма"}},
	{Name: "Учебники", Icon: "0xf5db|0x10f5db", Keys: []string{"Учебники", "Книг", "Учебн", "Прописи", "Метод", "литерат", "Диск"}},
	{Name: "Доска", Icon: "0xf51b|0x10f51b", Keys: []string{"Доска"}},
	{Name: "Интерактивная доска", Icon: "0xf51c|0x10f51c", Keys: []string{"Интерактивная доска", "smart"}},
	{Name: "Сетевое оборудование", Icon: "0xf6ff|0x10f6ff", Keys: []string{"Сетевое оборудование", "сетев", "cеть", "Точка", "роут"}},
	{Name: "Мышь", Icon: "0xf8cc|0x10f8cc", Keys: []string{"Мышь"}},
	{Name: "Клавиатура", Icon: "0xf11c|0x10f11c", Keys: []string{"Клавиатура"}},
	{Name: "Веб-камера", Icon: "0xf832|0x10f832", Keys: []string{"Веб-камера"}},
	{Name: "Документ-камера", Icon: "0xf81a|0x10f81a", Keys: []string{"Документ-камера"}},
	{Name: "Колонтки", Icon: "0xf8e0|0x10f8e0", Keys: []string{"Колонтки"}},
	{Name: "Наушники", Icon: "0xf590|0x10f590", Keys: []string{"Наушники"}},
	{Name: "Сетевой фильтр", Icon: "0xf1e6|0x10f1e6", Keys: []string{"Сетевой фильтр"}},
}