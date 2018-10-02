#Использовать v8runner
#Использовать json

Конфигуратор = Новый УправлениеКонфигуратором();

КаталогСкрипта = Новый Файл(ТекущийСценарий().Источник).Путь;	
ЧтениеТекста = Новый ЧтениеТекста(КаталогСкрипта + "/СписокХранилищ.json");
СтрокаJSON = ЧтениеТекста.Прочитать();
ЧтениеТекста.Закрыть();	
_преобразовательJSON = Новый ПарсерJSON();
ПараметрыJSON = _преобразовательJSON.ПрочитатьJSON(СтрокаJSON);
ПараметрыХранилищ = ПараметрыJSON.Получить("list_reps");


Пользователь1С 				= ПараметрыJSON.Получить("user_1C");
ПарольПользователя1С 		= ПараметрыJSON.Получить("pass_user_1C");

ПользовательАдминХранилища  = ПараметрыJSON.Получить("user_storage_admin");
ПарольАдминХранилища		= ПараметрыJSON.Получить("pas_storage_admin");

ПользовательХранилища  		= ПараметрыJSON.Получить("user_storage");
ПарольХранилища				= ПараметрыJSON.Получить("pass_storage");



ПараметрыНовогоХранилища 	= ПараметрыJSON.Получить("array_new_storage");

ЭтоНовыйПользователь = Истина;



Если ЭтоНовыйПользователь Тогда	
	Для каждого ПутьКХранилищу Из ПараметрыХранилищ Цикл
	//ПутьКХранилищу = "C:\\1c-Repository\\ut-ds-develop";
		Попытка
			Конфигуратор.ДобавитьПользователяВХранилище(ПутьКХранилищу,"dbelmach","dbelmach","opyshnoy","opyshnoy",ПраваПользователяХранилища.ПравоИзмененияВерсий);
			//Конфигуратор.КопироватьПользователейИзХранилища("D:\\1c-Repository\\mfo-ds-deploy","Администратор","admin",ПутьКХранилищу,"Администратор","admin");
			Сообщить("Пользователь создан в хранилище:" +  ПутьКХранилищу);
		Исключение
			Сообщить(ОписаниеОшибки());
			//Продолжить;
		КонецПопытки	
	КонецЦикла;
	
Иначе
	Для каждого СтруктураНовогоХранилища Из ПараметрыНовогоХранилища Цикл
	
		СтрокаНовогоХранилища = СтруктураНовогоХранилища["storage_new"];	//"D:\1c-Repository\bitfinace-ds-deploy";
		СтрокаДонор = СтруктураНовогоХранилища["storage_donor"];			//C:\1c-Repository\BitFinace-ds-develop";
		
		Контекст = "/IBConnectionString"+"""Srvr="+СтруктураНовогоХранилища["server"]+"; Ref='"+СтруктураНовогоХранилища["basename"]+"'""";//"/IBConnectionString""Srvr=ds-dev-app1; Ref='acccorp-ds-rc'""";
		
		Конфигуратор.УстановитьКонтекст(Контекст,Пользователь1С, ПарольПользователя1С);
		
		Попытка 
			Конфигуратор.СоздатьФайловоеХранилищеКонфигурации(СтрокаНовогоХранилища,ПользовательАдминХранилища,ПарольАдминХранилища);
			Сообщить("Создано хранилище " + СтрокаНовогоХранилища);
		Исключение
			Сообщить(ОписаниеОшибки());
			Прервать;
		КонецПопытки;
			
		Попытка
			Конфигуратор.КопироватьПользователейИзХранилища(СтрокаНовогоХранилища,ПользовательАдминХранилища,ПарольАдминХранилища,СтрокаДонор,ПользовательХранилища,ПарольХранилища);
			Сообщить("Пользователи из хранилища "+СтрокаДонор+" перенесены в новое хранилище "+СтрокаНовогоХранилища);
		Исключение
			Сообщить(ОписаниеОшибки());
			Продолжить;
		КонецПопытки
	КонецЦикла;	
КонецЕсли;