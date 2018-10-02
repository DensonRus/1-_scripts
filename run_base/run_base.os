#Использовать v8runner
#Использовать json
#Использовать cmdline

//Конфигуратор = Новый УправлениеКонфигуратором();
//ПараметрыЗапуска = Конфигуратор.ПолучитьПараметрыЗапуска();
//Конфигуратор.УстановитьКонтекст("/IBConnectionString""Srvr=ds-dev-app1; Ref='ut_ds_RC'""","", "");
//Конфигуратор.ОтключитьсяОтХранилища();
//СтрокаСоединениеСХранилищем = "C:\1c-Repository\ut-ds-deploy";
//ОбновитьКонфигурациюБазыДанныхИзХранилища
//Конфигуратор.ПодключитьсяКХранилищу(СтрокаСоединениеСХранилищем,"UtTestUpDate","UtTestUpDate",Истина);
//Конфигуратор.ПодключитьсяКХранилищу(СтрокаСоединениеСХранилищем,"UtTestUpDate","UtTestUpDate",Истина);
//Конфигуратор.ОбновитьКонфигурациюБазыДанных();

Перем СтрокаПодключения;
Перем ИмяБазы;
Перем РежимЗапуска;
Перем ПараметрыБазы;
Перем Логин;
Перем Пароль;



Процедура ЧтениеНастроекJSON()
	
	КаталогСкрипта = Новый Файл(ТекущийСценарий().Источник).Путь;	
	ЧтениеТекста = Новый ЧтениеТекста(КаталогСкрипта + "/users.json");
	СтрокаJSON = ЧтениеТекста.Прочитать();
	ЧтениеТекста.Закрыть();	
	_преобразовательJSON = Новый ПарсерJSON();
	ПараметрыJSON = _преобразовательJSON.ПрочитатьJSON(СтрокаJSON);
	ПараметрыБазы = ПараметрыJSON.Получить(ИмяБазы);
	
КонецПроцедуры



Процедура Инициализация()
	
	
	КаталогСкрипта = Новый Файл(ТекущийСценарий().Источник).Путь;	
	ЧтениеТекста = Новый ЧтениеТекста(КаталогСкрипта + "/users.json");
	СтрокаJSON = ЧтениеТекста.Прочитать();
	ЧтениеТекста.Закрыть();	
	_преобразовательJSON = Новый ПарсерJSON();
	ПараметрыJSON = _преобразовательJSON.ПрочитатьJSON(СтрокаJSON);
	СтрокаПодключения = ПараметрыJSON.Получить("base_path");
	Пользователи = ПараметрыJSON.Получить("users");
	//Сообщить(Тип(Пользователи));
	//Сообщить(СтрокаПодключения);
	Контекст = "/IBConnectionString" +""""+ СтрокаПодключения+"""";
	Конфигуратор = Новый УправлениеКонфигуратором();
	Для каждого стр ИЗ Пользователи Цикл
		
		
		Конфигуратор.УстановитьКонтекст(Контекст,стр["login"], стр["pass"]);
		
		Конфигуратор.ЗапуститьВРежимеПредприятия(,ИСТИНА);
		
		
	КонецЦикла
	
	//Контекст = "/IBConnectionString" +""""+ СтрокаПодключения+"""";
	
	//Конфигуратор = Новый УправлениеКонфигуратором();
	//Конфигуратор.УстановитьКонтекст(Контекст,Логин, Пароль);
	
	//Конфигуратор.ЗапуститьВРежимеПредприятия(,ИСТИНА);
	
	
	
КонецПроцедуры	

Инициализация();