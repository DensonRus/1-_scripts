#Использовать TRun1C 
// Создадим объект
Запуск1С = Новый ТУправлениеЗапуском1С();

// Введем параметры
ПараметрыЗапуска = Запуск1С.ПараметрыЗапуска;
ПараметрыЗапуска.ПутьКПлатформе1С = "C:\Program Files\1cv8\8.3.12.1412\bin\1cv8.exe";
ПараметрыЗапуска.ТипБазы = "F";
ПараметрыЗапуска.ИмяБазы = "E:\FileBase\EvtHUB";
//ПараметрыЗапуска.АдресКластера = "10.1.1.40";
//ПараметрыЗапуска.ПортКластера = "2541";
//ПараметрыЗапуска.ПортАгента = "2540";
ПараметрыЗапуска.ИмяПользователя = "";
ПараметрыЗапуска.ПарольПользователя = "";
//ПараметрыЗапуска.ВидныДействияВПакетномРежиме = Ложь; //Можно не указывать
//ПараметрыЗапуска.АдресХранилища = "C:\repo\OS_TScripts\_Tests\Repository";
//ПараметрыЗапуска.ИмяПользователяХранилища = "admin";
//ПараметрыЗапуска.ПарольПользователяХранилища = "1";

Для л=0 По  10 Цикл

Если Запуск1С.ЗапуститьПредприятие() Тогда
	Сообщить("ЗапуститьКонфигуратор: УСПЕШНО");
Иначе
	Сообщить("ЗапуститьКонфигуратор: " + Запуск1С.ТекстОшибки);
	БылиОшибки = Истина;
КонецЕсли;

КонецЦикла