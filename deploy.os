#Использовать v8runner
#Использовать params

Конфигуратор = Новый УправлениеКонфигуратором();
//ПараметрыЗапуска = Конфигуратор.ПолучитьПараметрыЗапуска();
//Конфигуратор.УстановитьКонтекст("/IBConnectionString""Srvr=ds-dev-app1; Ref='ut_ds_RC'""","БельмачДА", "Tele217091");
Конфигуратор.УстановитьКонтекст("/IBConnectionString""Srvr=ds-dev-app1; Ref='ut_ds_develop_dbelmach'""","БельмачДА", "Tele217091");
//Конфигуратор.ОтключитьсяОтХранилища();

СтрокаСоединениеСХранилищем = "C:\1c-Repository\ut-ds-develop";
//ОбновитьКонфигурациюБазыДанныхИзХранилища
Конфигуратор.ПодключитьсяКХранилищу(СтрокаСоединениеСХранилищем,"dbelmach","dbelmach",Истина);
//Конфигуратор.ПодключитьсяКХранилищу(СтрокаСоединениеСХранилищем,"UtTestUpDate","UtTestUpDate",Истина);
Конфигуратор.ОбновитьКонфигурациюБазыДанных();

