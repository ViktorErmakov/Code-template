﻿{1,
{7,
{"Code Template ",1,0,"",""},
{0,
{"Пример комментария",0,0,"комм","// НаименованиеСерииЗадач-<?""Номер задачи""> <?"""", ПолноеИмяПользователя> <?"""", ДатаВремя, ""ДЛФ=D""> Начало
// НаименованиеСерииЗадач-<?""Номер задачи""> <?"""", ПолноеИмяПользователя> <?"""", ДатаВремя, ""ДЛФ=D""> Окончание"}
},
{1,
{"Общее описание встроенного языка",1,0,"",""},
{3,
{"Операторы и синтаксические конструкции",1,0,"",""},
{0,
{"Функция",0,0,"Функ[ция]","Функция <?""Имя функции"">()

	РезультатФункции = Неопределено;
	<?>
	Возврат РезультатФункции;

КонецФункции // <?""Имя функции"">()
"}
},
{0,
{"Функция модуля формы",0,0,"Функ[ция]","&<?""Выберите директиву компиляции"", ВыборВарианта, ""НаКлиенте"", ""НаКлиенте"", ""НаСервере"", ""НаСервере"", ""НаСервереБезКонтекста"", ""НаСервереБезКонтекста"", ""НаКлиентеНаСервереБезКонтекста"", ""НаКлиентеНаСервереБезКонтекста"">
Функция <?""Имя функции"">()

	РезультатФункции = Неопределено;
	<?>
	Возврат РезультатФункции;

КонецФункции // <?""Имя функции"">()
"}
},
{0,
{"Функция модуля команды",0,0,"Функ[ция]","&<?""Выберите директиву компиляции"", ВыборВарианта, ""НаКлиенте"", ""НаКлиенте"", ""НаСервере"", ""НаСервере"", ""НаКлиентеНаСервере"", ""НаКлиентеНаСервере"">
Функция <?""Имя функции"">()

	РезультатФункции = Неопределено;
	<?>
	Возврат РезультатФункции;

КонецФункции // <?""Имя функции"">()
"}
}
}
},
{2,
{"Глобальный контекст",1,0,"",""},
{1,
{"Процедуры и функции работы с информационной базой",1,0,"",""},
{0,
{"НачатьТранзакцию",0,0,"Тр","НачатьТранзакцию();

Попытка
	
	ЗафиксироватьТранзакцию();
	
Исключение
	
	Если ТранзакцияАктивна() Тогда
		ОтменитьТранзакцию();
	КонецЕсли;
	
	//ЗаписьЖурналаРегистрации(
		//ТипОперации, 
		//УровеньЖурналаРегистрации.Ошибка,, 
		//Текст, 
		//ПодробноеПредставлениеОшибки(ИнформацияОбОшибке()));
		
	ВызватьИсключение;
	
КонецПопытки;
"}
}
},
{1,
{"Функции форматирования",1,0,"",""},
{0,
{"Шаблон текста",0,0,"Шабл","ШаблонТекст = НСтр(""ru = ''"");"}
}
}
},
{9,
{"Общие объекты",1,0,"",""},
{1,
{"Web-сервисы",1,0,"",""},
{0,
{"Вызвов с передачей ОбъектаXDTO",0,0,"","
Определения = Новый WSОпределения(АдресВебСервиса + ""?wsdl"");

// Тип берем именно через Определения, это нужно просто знать
СкладТип = Определения.ФабрикаXDTO.Тип(""http://www.1c-uc3.ru"", ""Склад"");
Склад = ФабрикаXDTO.Создать(СкладТип);

Прокси = Новый WSПрокси(Определения, ""http://www.1c-uc3.ru"", ""Тест"", ""ТестSoap"");

Склад.Наименование = ""ТестовыйСклад"";
Склад.МОЛ = ""Ермаков Виктор Викторович"";
Склад.ТипСклада = ""Розничный"";

// Вызов функции Web-сервиса
СкладСоздан = Прокси.СоздатьСклад(Склад);"}
}
},
{4,
{"JSON",1,0,"",""},
{0,
{"ЗаписьЧтение_РучнаяСериализация",0,0,"","
#Область Запись

Процедура ЗаписьJsonСРучнойСериализацией()
	
	НастройкиСериализации = Новый НастройкиСериализацииJSON;
	
	// Указываем как будет записана дата.
	НастройкиСериализации.ФорматСериализацииДаты = ФорматДатыJSON.JavaScript;
	НастройкиСериализации.ВариантЗаписиДаты = ВариантЗаписиДатыJSON.УниверсальнаяДата;
	
	Запись = Новый ЗаписьJSON;
	Путь = Константы.ПутьДоФайлов.Получить()+""\"";
	Запись.ОткрытьФайл(Путь + ""js.json"");
	
	Стр = Новый Структура(
		""Код, Наименование, ПолноеНаименование"",
		Контрагент.Код, Контрагент.Наименование, Контрагент.ПолноеНаименование());
	
	Массив = Новый Массив;
	Для Каждого ТекСтрока Из Контрагент.Контакты Цикл
		
		СтрКЛ = Новый Структура(""КЛ, Телефон"", """", """");
		СтрКЛ.Кл = ТекСтрока.КонтактноеЛицо;
		СтрКЛ.Телефон = ТекСтрока.Телефон;
		
		Массив.Добавить(СтрКЛ);
		
	КонецЦикла;
	
	Стр.Вставить(""Массив"",Массив);
	Стр.Вставить(""ДатаСведений"",ТекущаяДата());
	Стр.Вставить(""UUID"",Контрагент.УникальныйИдентификатор());
	
	ЗаписатьJSON(Запись, Стр, НастройкиСериализации, ""СериализацияЗначений"", ЭтаФорма);
	Запись.Закрыть();
	
КонецПроцедуры

// Сериализует реквизиты не допустимых типов.
Функция СериализацияЗначений(Свойство, Значение, ДополнительныеПараметры, Отказ) Экспорт
	
	Если ТипЗнч(Значение) = Тип(""УникальныйИдентификатор"") Тогда
		Возврат Строка(Значение);
	КонецЕсли;
	
	// Не делаем сериализуцию для других типов.
	Отказ = Истина;
	
КонецФункции

#КонецОбласти

#Область Чтение

Процедура ЧтениеJsonСРучнойСериализацией()
	
	Чтение = Новый ЧтениеJSON;
	
	//Получает данные из файла
	Путь = Константы.ПутьДоФайлов.Получить()+""\"";
	Чтение.ОткрытьФайл(Путь+""js.json"");
	//Подставляем в строку значение
	//ЧтениеJSON.УстановитьСтроку(Значение);
	
	// Указываем в массиве только те реквизиты, которые нужно преобразовать, для исключения лишних вызовов.
	Реквизиты = Новый Массив;
	Реквизиты.Добавить(""ДатаСведений"");
	Реквизиты.Добавить(""UUID"");
	
	Данные = ПрочитатьJSON(Чтение, Ложь,,, ""ФункцияВосстановленияЧтения"", ЭтаФорма,, Реквизиты);
	Чтение.Закрыть();
	
КонецПроцедуры

// Обратная сериализация типов при чтении.
Функция ФункцияВосстановленияЧтения(Свойство, Значение, ДополнительныеПараметры) Экспорт
	
	Если Свойство = ""ДатаСведений"" Тогда
		Возврат ПрочитатьДатуJSON(Формат(Значение, ""ЧГ=""), ФорматДатыJSON.JavaScript);
	КонецЕсли;
	
	Если Свойство = ""UUID"" Тогда
		Возврат Новый УникальныйИдентификатор(Значение);
	КонецЕсли;
	
КонецФункции

#КонецОбласти"}
},
{0,
{"ЗаписьЧтение_АвтоСериализация",0,0,"","#Область Запись

Процедура ЗаписьJsonСАвтоСериализацией()
	
	Запись = Новый ЗаписьJSON;
	Путь= Константы.ПутьДоФайлов.Получить() + ""\"";
	Запись.ОткрытьФайл(Путь + ""js.json"");
	
	// Используется если тип мы не хотим явно задавать в выгрузке, и он будет определен при загрузке.
	//СериализаторXDTO.ЗаписатьJSON(Запись, Контрагент.ПолучитьОбъект());
	
	СериализаторXDTO.ЗаписатьJSON(Запись, Контрагент.ПолучитьОбъект(), НазначениеТипаXML.Явное);
	
	Запись.Закрыть();
	
КонецПроцедуры

#КонецОбласти

#Область Загрузка

Процедура ЧтениеJsonСАвтоСериализацией()
	
	Чтение = Новый ЧтениеJSON;
	Путь= Константы.ПутьДоФайлов.Получить()+ ""\"";
	Чтение.ОткрытьФайл(Путь + ""js.json"");
	
	// Используется если при выгрузке не был указан явно тип объекта выгружаемого.
	//Данные = СериализаторXDTO.ПрочитатьJSON(Чтение, Тип(""СправочникОбъект.Контрагенты""));
	
	Данные = СериализаторXDTO.ПрочитатьJSON(Чтение);
	
	Чтение.Закрыть();
	
КонецПроцедуры

#КонецОбласти"}
},
{0,
{"ПотоковаяЗаписьЧтение",0,0,"","
Процедура ПотоковаяЗапись()
	
	ПараметрыJSON = Новый ПараметрыЗаписиJSON(ПереносСтрокJSON.Авто, "" "", Истина);
	Запись = Новый ЗаписьJSON;
	
	Путь= Константы.ПутьДоФайлов.Получить() + ""\"";
	Запись.ОткрытьФайл(Путь + ""js.json"",,, ПараметрыJSON);
	
	Запись.ЗаписатьНачалоОбъекта();
	Запись.ЗаписатьИмяСвойства(""СвойствоОбъекта1"");
	Запись.ЗаписатьЗначение(""Значение1"");
	Запись.ЗаписатьИмяСвойства(""СвойствоОбъекта2"");
	Запись.ЗаписатьНачалоОбъекта();
	Запись.ЗаписатьИмяСвойства(""СвойствоВложенногоОбъекта1"");
	Запись.ЗаписатьЗначение(""Зн СВО1"");
	Запись.ЗаписатьИмяСвойства(""СвойствоВложенногоОбъекта2"");
	Запись.ЗаписатьЗначение(""Зн СВО2"");
	Запись.ЗаписатьКонецОбъекта();
	Запись.ЗаписатьИмяСвойства(""Массив"");
	Запись.ЗаписатьНачалоМассива();
	Запись.ЗаписатьЗначение(3.141592654, Истина);
	Запись.ЗаписатьЗначение(2.718281828, Ложь);
	Запись.ЗаписатьКонецМассива();
	Запись.ЗаписатьКонецОбъекта();
	Запись.Закрыть();
	
КонецПроцедуры

Процедура ПотоковоеЧтение()
	
	Чтение = Новый ЧтениеJSON;
	
	Путь= Константы.ПутьДоФайлов.Получить() + ""\"";
	Чтение.ОткрытьФайл(Путь + ""js.json"");
	
	Пока Чтение.Прочитать() Цикл
		
		Сообщить(""Тип текущего элемента "" + Чтение.ТипТекущегоЗначения);
		Если Чтение.ТипТекущегоЗначения = ТипЗначенияJSON.ИмяСвойства Тогда
			Сообщить(""Имя = "" + Чтение.ТекущееЗначение);
		КонецЕсли;
		
		Если Чтение.ТипТекущегоЗначения = ТипЗначенияJSON.Булево Или
			Чтение.ТипТекущегоЗначения = ТипЗначенияJSON.Строка Или 
			Чтение.ТипТекущегоЗначения = ТипЗначенияJSON.Число Или 
			Чтение.ТипТекущегоЗначения = ТипЗначенияJSON.Комментарий Тогда
			Сообщить(""Значение = "" + Чтение.ТекущееЗначение);
		КонецЕсли;
		
	КонецЦикла;
	
	Чтение.Закрыть();
	
КонецПроцедуры


"}
},
{0,
{"СовмещениеТехник",0,0,"","Процедура СовмещениеТехник()
	
	Перем КогдаСформировано, СписокЗаказов;
	
	НастройкиСериализации = Новый НастройкиСериализацииJSON;
	НастройкиСериализации.ВариантЗаписиДаты = ВариантЗаписиДатыJSON.УниверсальнаяДата;
	НастройкиСериализации.ФорматСериализацииДат = ФорматДатыJSON.ISO;
	НастройкиСериализации.СериализовыватьМассивыКакОбъекты = Истина;
	
	ПараметрыJSON = Новый ПараметрыЗаписиJSON(ПереносСтрокJSON.Авто, "" "", Истина);
	
	Запись = Новый ЗаписьJSON;
	Запись.ПроверятьСтруктуру = Истина;
	Запись.ОткрытьФайл(""c:\temp\combinedWrite.json"", , , ПараметрыJSON);
	
	Запись.ЗаписатьНачалоОбъекта();
	Запись.ЗаписатьИмяСвойства(""ДатаФормирования"");
	Запись.ЗаписатьЗначение(ЗаписатьДатуJSON(КогдаСформировано, ФорматДатыJSON.ISO, ВариантЗаписиДатыJSON.УниверсальнаяДата));
	Запись.ЗаписатьИмяСвойства(""Заказы"");
	
	Заказы = Новый Массив;
	Для Каждого Заказ Из СписокЗаказов Цикл
		
		ОписаниеЗаказа = Новый Структура(""Ссылка, Номер, Дата, Контрагент"");
		ОписаниеЗаказа.Ссылка = Строка(Заказ.Ссылка);
		ОписаниеЗаказа.Номер = Заказ.Номер;
		ОписаниеЗаказа.Дата = Заказ.Дата;
		ОписаниеЗаказа.Контрагент = Строка(Заказ.Контрагент);
		Заказы.Добавить(ОписаниеЗаказа);
		
	КонецЦикла;
	
	ЗаписатьJSON(Запись, Заказы, НастройкиСериализации);
	Запись.ЗаписатьКонецОбъекта();
	Запись.Закрыть();
	
КонецПроцедуры"}
}
},
{4,
{"HTTP-сервисы",1,0,"",""},
{0,
{"ЗапросGET",0,1,"HTTPСервисЗапрос","
СерверИсточник = ""localhost"";
Адрес = ""/Start/hs/root/nomen/"" + Артикул;
Чтение = Новый ЧтениеJSON;

HTTPЗапрос = Новый HTTPЗапрос(Адрес);
НТТР = Новый HTTPСоединение(СерверИсточник);

#Область ЧтениеВФайл

ИмяВходящегоФайла = ПолучитьИмяВременногоФайла(""json"");

НТТРОтвет = НТТР.Получить(HTTPЗапрос, ИмяВходящегоФайла);
Если НТТРОтвет.КодСостояния = 200 Тогда
	
	Чтение.ОткрытьФайл(ИмяВходящегоФайла);
	// Получаем данные как массив структур
	Данные = ПрочитатьJSON(Чтение, Истина);
	
КонецЕсли;

#КонецОбласти

#Область ЧтениеВДанные

НТТРОтвет = НТТР.Получить(HTTPЗапрос);

Если НТТРОтвет.КодСостояния = 200 Тогда
	
	Чтение.УстановитьСтроку(НТТРОтвет.ПолучитьТелоКакСтроку());
	Данные = ПрочитатьJSON(Чтение, Истина);
	
КонецЕсли;

#КонецОбласти"}
},
{0,
{"ОтветGET",0,1,"HTTPСервисОтвет","Функция ОтветGET(Запрос)
	
	Артикул = Запрос.ПараметрыURL[""Артикул""];
	Ссылка = Справочники.Номенклатура.НайтиПоРеквизиту(""Артикул"", Артикул);
	
	// Если ссылка не найдена ответ 404 (не найдено).
	Если Ссылка.Пустая() Тогда
		Ответ = Новый HTTPСервисОтвет(404);
		Возврат Ответ;
	КонецЕсли;
	
	// При необходимости заполняем параметры записи. 
	// Если параметры не меняются, то и создавть их не нужно, т.к. по умолчанию они такие же.
	ПараметрыЗаписи = Новый ПараметрыЗаписиJSON;
	
	Запись = Новый ЗаписьJSON;
	Запись.УстановитьСтроку(ПараметрыЗаписи);
	
	// Используем соответствие, т.к. ключи могут быть сложные.
	Реквизиты = Новый Соответствие;
	Реквизиты.Вставить(""Код"", Ссылка.Код);
	Реквизиты.Вставить(""Наименование"", Ссылка.Наименование);
	Реквизиты.Вставить(""Услуга"", Ссылка.Услуга);
	
	ЗаписатьJSON(Запись, Реквизиты);
	Данные = Запись.Закрыть();
	
	Ответ = Новый HTTPСервисОтвет(200);
	Ответ.Заголовки.Вставить(""Content-type"", ""application/json; charset=utf-8"");
	Ответ.УстановитьТелоИзСтроки(Данные);
	
	Возврат Ответ;
	
КонецФункции"}
},
{0,
{"ЗапросPOST с параметрами",0,0,"","// Вариант когда для ответа нам, нужно послать параметры в json формате.
СерверИсточник = ""localhost"";
Адрес = ""/Start/hs/root/nomen/"" + Артикул;

// При необходимости заполняем параметры записи.
ПараметрыЗаписи = Новый ПараметрыЗаписиJSON;

// Параметры Запроса+++
Запись = Новый ЗаписьJSON;
Запись.УстановитьСтроку(ПараметрыЗаписи);

Стр = Новый Структура(""Наименование, Услуга"");
Стр.Наименование = ""Наименование"";
Стр.Услуга = Истина;

ЗаписатьJSON(Запись, Стр);
Данные = Запись.Закрыть();
// Параметры Запроса---

HTTPЗапрос = Новый HTTPЗапрос(Адрес);
HTTPЗапрос.УстановитьТелоИзСтроки(Данные);

HTTP = Новый HTTPСоединение(СерверИсточник);
HTTPОтвет = HTTP.ОтправитьДляОбработки(HTTPЗапрос);

Если HTTPОтвет.КодСостояния = 201 Тогда
	ДанныеСтрокой = HTTPОтвет.ПолучитьТелоКакСтроку(""UTF-8"");
	Сообщить(ДанныеСтрокой);
КонецЕсли;"}
},
{0,
{"ОтветPOST по параметрам",0,1,"HTTPСервисОтветPOST","Функция ОтветPOST(Запрос)
	
	// Отвечаем на запрос с присланными параметрами json в строке запроса.
	Артикул = Запрос.ПараметрыURL[""Артикул""];
	ПараметрыЗапроса = Запрос.ПолучитьТелоКакСтроку(""UTF-8"");
	
	Чтение = Новый ЧтениеJSON;
	Чтение.УстановитьСтроку(ПараметрыЗапроса);
	Параметры = ПрочитатьJSON(Чтение, Ложь);
	
	ОбъектНоменклатура = Справочники.Номенклатура.СоздатьЭлемент();
	ОбъектНоменклатура.Наименование = Параметры.Наименование;
	ОбъектНоменклатура.Услуга = Параметры.Услуга;
	ОбъектНоменклатура.Артикул = Параметры.Артикул;
	ОбъектНоменклатура.УстановитьНовыйКод();
	ОбъектНоменклатура.Записать();
	
	Ответ = Новый HTTPСервисОтвет(201);
	Ответ.УстановитьТелоИзСтроки(Строка(ОбъектНоменклатура.Ссылка.УникальныйИдентификатор()));
	Возврат Ответ;
	
КонецФункции"}
}
},
{1,
{"ОбщийМодуль",1,0,"",""},
{0,
{"Области общего модуля",0,0,"[Обл]асти общего модуля","#Область ПрограммныйИнтерфейс
// Код процедур и функций
#КонецОбласти

#Область СлужебныйПрограммныйИнтерфейс
// Код процедур и функций
#КонецОбласти

#Область СлужебныеПроцедурыИФункции
// Код процедур и функций
#КонецОбласти"}
}
},
{1,
{"Система компоновки данных",1,0,"",""},
{1,
{"Настройки компоновки данных",1,0,"",""},
{0,
{"Условное оформление компоновки данных",0,0,"[Усл]овное оформление","	ЭлементУсловногоОформления = УсловноеОформление.Элементы.Добавить();
	
	ГруппаЭлементовОтбораДанных               = ЭлементУсловногоОформления.Отбор.Элементы.Добавить(Тип(""ГруппаЭлементовОтбораКомпоновкиДанных""));
	ГруппаЭлементовОтбораДанных.ТипГруппы     = ТипГруппыЭлементовОтбораКомпоновкиДанных.ГруппаИли; // Или; И...
	ГруппаЭлементовОтбораДанных.Использование = Истина;
	
	ЭлементОтбораДанных                = ГруппаЭлементовОтбораДанных.Элементы.Добавить(Тип(""ЭлементОтбораКомпоновкиДанных""));
	ЭлементОтбораДанных.ЛевоеЗначение  = Новый ПолеКомпоновкиДанных(""Объект.Зарплата.Сумма"");
	ЭлементОтбораДанных.ВидСравнения   = ВидСравненияКомпоновкиДанных.Меньше;
	ЭлементОтбораДанных.ПравоеЗначение = 10000;
	ЭлементОтбораДанных.Использование  = Истина;
	
	ЭлементОтбораДанных                = ГруппаЭлементовОтбораДанных.Элементы.Добавить(Тип(""ЭлементОтбораКомпоновкиДанных""));
	ЭлементОтбораДанных.ЛевоеЗначение  = Новый ПолеКомпоновкиДанных(""Объект.Зарплата.Сумма"");
	ЭлементОтбораДанных.ВидСравнения   = ВидСравненияКомпоновкиДанных.Больше;
	ЭлементОтбораДанных.ПравоеЗначение = 50000;
	ЭлементОтбораДанных.Использование  = Истина;
	
	ЭлементОформляемогоПоля               = ЭлементУсловногоОформления.Поля.Элементы.Добавить();
	ЭлементОформляемогоПоля.Поле          = Новый ПолеКомпоновкиДанных(Элементы.ЗарплатаНомерСтроки.Имя); // Обязательно через текстовое поле оформление идет
	ЭлементОформляемогоПоля.Использование = Истина;
	
	ЭлементУсловногоОформления.Оформление.УстановитьЗначениеПараметра(""ЦветФона"", WebЦвета.ЗеленаяЛужайка);"}
}
}
},
{1,
{"Работа с объектами метаданных",1,0,"",""},
{2,
{"ОбъектыМетаданных",1,0,"",""},
{0,
{"Области модулей наборов записей и т.п.",0,0,"[Обл]асти модулей наборов записей и т.п.","#Область ОписаниеПеременных
// Не обязательная область
#КонецОбласти

#Область ПрограммныйИнтерфейс
// Код процедур и функций
#КонецОбласти

#Область ОбработчикиСобытий
// Код процедур и функций
#КонецОбласти

#Область СлужебныйПрограммныйИнтерфейс
// Код процедур и функций
#КонецОбласти

#Область СлужебныеПроцедурыИФункции
// Код процедур и функций
#КонецОбласти"}
},
{0,
{"Области модулей менеджера, объекта",0,0,"[Обл]асти модулей менеджера, объекта","#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда
	
	#Область ОписаниеПеременных
	// Не обязательная область
	#КонецОбласти
	
	#Область ПрограммныйИнтерфейс
	// Код процедур и функций
	#КонецОбласти
	
	#Область ОбработчикиСобытий
	// Код процедур и функций
	#КонецОбласти
	
	#Область СлужебныйПрограммныйИнтерфейс
	// Код процедур и функций
	#КонецОбласти
	
	#Область СлужебныеПроцедурыИФункции
	// Код процедур и функций
	#КонецОбласти
	
#Иначе
	ВызватьИсключение НСтр(""ru = 'Недопустимый вызов объекта на клиенте.'"");
#КонецЕсли

"}
}
}
},
{1,
{"Управление блокировкой данных",1,0,"",""},
{0,
{"Блокировка данных",0,0,"блок","Блокировка = Новый БлокировкаДанных;
ЭлементБлокировки = Блокировка.Добавить(""РегистрНакопления.ТоварыНаСкладах"");
ЭлементБлокировки.УстановитьЗначение(""Качество"", Справочники.Качество.НайтиПоКоду(""1""));
ЭлементБлокировки.Режим = РежимБлокировкиДанных.Исключительный;
ЭлементБлокировки.ИсточникДанных = ДокументОбъект.ВозвратнаяТара;
ЭлементБлокировки.ИспользоватьИзИсточникаДанных(""Номенклатура"", ""Номенклатура"");
ЭлементБлокировки.ИспользоватьИзИсточникаДанных(""Склад"", ""Склад"");
Блокировка.Заблокировать();"}
}
},
{1,
{"COMОбъкты",1,0,"",""},
{0,
{"Чтение SQL запроса ADODB",0,0,"","Результат = Новый ТаблицаЗначений;
	
	Попытка
		
		Команда = Новый COMОбъект(""ADODB.Command"");
		Выборка = Новый COMОбъект(""ADODB.RecordSet"");
		Команда.ActiveConnection = Соединение;
		Команда.CommandText = ТекстИнструкции;
		Выборка = Команда.Execute();
		Если Выборка.BOF = Ложь Тогда
			
			Выборка.MoveFirst();
			Для НомерСтолбца = 0 По Выборка.Fields.Count - 1 Цикл
				
				ИмяСтолбца = Выборка.Fields.Item(НомерСтолбца).Name;
				Результат.Колонки.Добавить(ИмяСтолбца);
				
			КонецЦикла;
			
			Выборка.MoveFirst();
			//Если Выборка.RecordCount > 0 Тогда
			Пока Выборка.EOF = Ложь Цикл
				
				НоваяСтрока = Результат.Добавить();
				Для НомерСтолбца = 0 По Выборка.Fields.Count - 1 Цикл
					Ячейка = Выборка.Fields.Item(НомерСтолбца);
					НоваяСтрока[Ячейка.Name] = Ячейка.Value;
				КонецЦикла;
				
				Выборка.MoveNext();
				
			КонецЦикла;
			//КонецЕсли;
		КонецЕсли;
		
	Исключение
		
		Результат = Неопределено;
		Ошибки = КраткоеПредставлениеОшибки(ИнформацияОбОшибке());
		
		ЗаписьЖурналаРегистрации(
			НСтр(""ru = 'Электронная очередь.Выполнение запроса к базе ЭО'""),
			УровеньЖурналаРегистрации.Ошибка, , ,
			НСтр(""ru = 'Во время выполнения действия произошла неизвестная ошибка.'"") + Символы.ПС +
			ПодробноеПредставлениеОшибки(ИнформацияОбОшибке()));
		
	КонецПопытки;
	
	Возврат Результат;"}
}
},
{1,
{"Табличный Документ",1,0,"",""},
{0,
{"Табличный документ в таблицу значений",0,0,"","ТабличныйДокумент = Новый ТабличныйДокумент;
Поток = Новый ФайловыйПоток(""Путь к файлу"", РежимОткрытияФайла.Открыть, ДоступКФайлу.Чтение);
ТабличныйДокумент.Прочитать(Поток, СпособЧтенияЗначенийТабличногоДокумента.Текст, ТипФайлаТабличногоДокумента.MXL);

ОбластьЯчеек = ТабличныйДокумент.Область(""первая строка"", ""первая колонка"", ТабличныйДокумент.ВысотаТаблицы, ТабличныйДокумент.ШиринаТаблицы);
ИсточникДанных = Новый ОписаниеИсточникаДанных(ОбластьЯчеек);

ПостроительОтчета = Новый ПостроительОтчета;
ПостроительОтчета.ИсточникДанных = ИсточникДанных;
ПостроительОтчета.Выполнить();

Таблица = ПостроительОтчета.Результат.Выгрузить();"}
}
}
},
{2,
{"Интерфейс (управляемый)",1,0,"",""},
{1,
{"Форма клиентского приложения",1,0,"",""},
{0,
{"Области модуля формы",0,0,"[Обл]асти модуля формы","#Область ОписаниеПеременных
// Не обязательная область
#КонецОбласти

#Область ОбработчикиСобытийФормы
// Код процедур и функций
#КонецОбласти

#Область ОбработчикиСобытийЭлементовШапкиФормы
// Код процедур и функций
#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормы<ИмяТаблицыФормы>
// Код процедур и функций
#КонецОбласти

#Область ОбработчикиКомандФормы
// Код процедур и функций
#КонецОбласти

#Область СлужебныеПроцедурыИФункции
// Код процедур и функций
#КонецОбласти"}
}
},
{0,
{"Область модуля команды",0,0,"[Обл]асти модуля команды","#Область ОбработчикиСобытий
// Код процедур и функций
#КонецОбласти

#Область СлужебныеПроцедурыИФункции
// Код процедур и функций
#КонецОбласти"}
}
},
{2,
{"Работа с запросами",1,0,"",""},
{0,
{"СохранитьЗапросСоЗначениямиПараметров",0,0,"","
// ИНСТРУКЦИЯ: копируем весь текст ниже в ОМ (создаем или используем существующий)
// Ставим точку останова там, где перемеременная ""запрос"" уже определена
// через ""ВычислитьВыражение"" вычисляем вызов экспортной процедуры 
// вот так: ""ВашОбщийМодуль.ЗаписатьЗапросыВФайлXML(Запрос)""
// в этот же момент запрос с параметрами и их значениями будет сохранен по пути указанному ниже в параметре процедуры.


// _ВыгрузкаЗапроса.ЗаписатьЗапросыВФайлXML(Запрос)
///////////////////////////////////////////////////////////////////////////
// ФУНКЦИИ РАБОТЫ С XML-ФАЙЛАМИ

// Записывает Запросы(текст и параметры запроса) в файл XML.
//
// Параметры:
//	ИмяФайла - имя файла XML.
//	Объект - передаваемый объект обработки.
//
Функция ЗаписатьЗапросыВФайлXML(знач ОбъектЗапроса, ИмяФайла = ""C:\Запросы\TekZapros.q1c"") Экспорт // Тут можно изменить путь
	
	ФайлXML = Новый ЗаписьXML;
	ФайлXML.ОткрытьФайл(ИмяФайла);
	ФайлXML.ЗаписатьОбъявлениеXML();
	ФайлXML.ЗаписатьНачалоЭлемента(""querylist"");
	// выгрузка запроса.
	Для Сч =1 По 2 Цикл
		ФайлXML.ЗаписатьНачалоЭлемента(""query"");
		Если Сч = 1 Тогда
			ФайлXML.ЗаписатьАтрибут(""name"", ""Запрос"");
		Иначе	
			ФайлXML.ЗаписатьАтрибут(""name"", ""ИсходныйЗапрос"");
		КонецЕсли; 
		
			ФайлXML.ЗаписатьНачалоЭлемента(""text"");
			ТекстЗапроса = ОбъектЗапроса.Текст;
			Для Счетчик = 1 По СтрЧислоСтрок(ТекстЗапроса) Цикл
				ПереносСтр	= Символы.ВК + Символы.ПС;
				ТекСтрока 	= СтрПолучитьСтроку(ТекстЗапроса, Счетчик);
				ФайлXML.ЗаписатьТекст(ТекСтрока);
				ФайлXML.ЗаписатьБезОбработки(ПереносСтр);
			КонецЦикла;
			ФайлXML.ЗаписатьКонецЭлемента();
			// Запись параметров в XML-файл.
			Если ОбъектЗапроса.Параметры.Количество() > 0 Тогда 
				ФайлXML.ЗаписатьНачалоЭлемента(""parameters"");
				Для каждого ТекПараметр из ОбъектЗапроса.Параметры Цикл 
						ИмяПараметра		= ТекПараметр.Ключ;
						ТипПараметра		= СтрЗаменить(Строка(ТипЗнч(ТекПараметр.Значение)),"" "","""");//ТекПараметр.Тип;   !!!
						ЗначениеПараметра			= ТекПараметр.Значение;
						
						ФайлXML.ЗаписатьНачалоЭлемента(""parameter"");
						ФайлXML.ЗаписатьАтрибут(""name"", ИмяПараметра);
						Если ТипПараметра = ""Списокзначений"" Тогда 
							
							ТЗ = Новый ТаблицаЗначений;
							тз.Колонки.Добавить(""Значения"");
							
							Для каждого ТекЗнач Из ЗначениеПараметра Цикл
								НовСтрТЗ = тз.Добавить();
								НовСтрТЗ.Значения = ТекЗнач.Значение;						
							КонецЦикла; 

							
							ФайлXML.ЗаписатьАтрибут(""type"", ""ТаблицаЗначений"");
							ЗаписатьТаблицуЗначенийВXML(ФайлXML, ТЗ);  //!!!

						ИначеЕсли ТипПараметра = ""Массив"" Тогда              //!!!
							
							ТЗ = Новый ТаблицаЗначений;
							тз.Колонки.Добавить(""Значения"");
							
							Для каждого ТекЗнач Из ЗначениеПараметра Цикл
								НовСтрТЗ = тз.Добавить();
								НовСтрТЗ.Значения = ТекЗнач;						
							КонецЦикла; 
							
							
							ФайлXML.ЗаписатьАтрибут(""type"", ""ТаблицаЗначений"");   //!!!
							ЗаписатьТаблицуЗначенийВXML(ФайлXML, ТЗ);  //!!!
						ИначеЕсли ТипПараметра = ""Таблицазначений"" Тогда
							ФайлXML.ЗаписатьАтрибут(""type"", ""ТаблицаЗначений"");
		
							ЗаписатьТаблицуЗначенийВXML(ФайлXML, ЗначениеПараметра);
						ИначеЕсли ТипПараметра = ""Моментвремени"" Тогда
							ФайлXML.ЗаписатьАтрибут(""type"", ""МоментВремени"");
							ЗаписатьМоментВремениВXML(ФайлXML, ЗначениеПараметра);
						ИначеЕсли ТипПараметра = ""Граница"" Тогда
							ФайлXML.ЗаписатьАтрибут(""type"", ТипПараметра);
							ЗаписатьГраницуВXML(ФайлXML, ЗначениеПараметра);
						Иначе
							ИмяТипа = ИмяТипаИзЗначения(ЗначениеПараметра); 
							ФайлXML.ЗаписатьАтрибут(""type"", ИмяТипа);
							ФайлXML.ЗаписатьАтрибут(""value"", XMLСтрока(ЗначениеПараметра));
						КонецЕсли;	
						ФайлXML.ЗаписатьКонецЭлемента();
				КонецЦикла;	
				ФайлXML.ЗаписатьКонецЭлемента();
			КонецЕсли;	
		ФайлXML.ЗаписатьКонецЭлемента();
    КонецЦикла;
	ФайлXML.ЗаписатьКонецЭлемента();
	ФайлXML.Закрыть();
	
	вСохранитьЗапросыВФайл(ОбъектЗапроса,СтрЗаменить(ИмяФайла,""q1c"",""sel""));
	
	Возврат Истина;
КонецФункции

// Записывает строки списка значений в Файл XML.
//
// Параметры:
//	ФайлXML - записьXML.
//	Значение - список значений.
//
Процедура ЗаписатьСписокЗначенийВXML(ФайлXML, Значение)
	Если ТипЗнч(Значение) <> Тип(""СписокЗначений"") Тогда 
		Возврат;
	КонецЕсли;	
	
	Для каждого СтрСписка из Значение Цикл
		ЗначениеЭлементаСписка	= СтрСписка.Значение;
		// Определение имени типа.
		ИмяТипа = ИмяТипаИзЗначения(ЗначениеЭлементаСписка); 
		
		ФайлXML.ЗаписатьНачалоЭлемента(""item"");
			ФайлXML.ЗаписатьАтрибут(""type"", ИмяТипа);
			ФайлXML.ЗаписатьАтрибут(""value"", XMLСтрока(ЗначениеЭлементаСписка));
		ФайлXML.ЗаписатьКонецЭлемента();
	КонецЦикла;	
КонецПроцедуры	

// Записывает строки списка значений в Файл XML.
//
// Параметры:
//	ФайлXML - записьXML.
//	Значение - список значений.
//
Процедура ЗаписатьМассивВXML(ФайлXML, Значение)
	Если ТипЗнч(Значение) <> Тип(""Массив"") Тогда 
		Возврат;
	КонецЕсли;	
	
	Для каждого СтрСписка из Значение Цикл
		ЗначениеЭлементаСписка	= СтрСписка;
		// Определение имени типа.
		ИмяТипа = ИмяТипаИзЗначения(ЗначениеЭлементаСписка); 
		
		ФайлXML.ЗаписатьНачалоЭлемента(""item"");
			ФайлXML.ЗаписатьАтрибут(""type"", ИмяТипа);
			ФайлXML.ЗаписатьАтрибут(""value"", XMLСтрока(ЗначениеЭлементаСписка));
		ФайлXML.ЗаписатьКонецЭлемента();
	КонецЦикла;	
КонецПроцедуры	

// Записывает ячейки таблицы значений в Файл XML.
//
// Параметры:
//	ФайлXML - записьXML.
//	Значение - таблица значений.
//
Процедура ЗаписатьТаблицуЗначенийВXML(ФайлXML, Значение)
	Если ТипЗнч(Значение) <> Тип(""ТаблицаЗначений"") Тогда 
		Возврат;
	КонецЕсли;	
	
	
	КолКолонок 	= Значение.Колонки.Количество();
	КолСтрок	= Значение.Количество();
	
	ФайлXML.ЗаписатьАтрибут(""colcount"", XMLСтрока(КолКолонок));
	ФайлXML.ЗаписатьАтрибут(""rowcount"", XMLСтрока(КолСтрок));

	
	Для СтрокаИндекс = 0 по КолСтрок - 1 Цикл
		Для КолонкаИндекс = 0 по КолКолонок - 1 Цикл 
			ЗначениеЭлементаСписка	= Значение.Получить(СтрокаИндекс).Получить(КолонкаИндекс);
			ИмяКолонки = Значение.Колонки.Получить(КолонкаИндекс).Имя;
			// Определение имени типа.
			ИмяТипа = ИмяТипаИзЗначения(ЗначениеЭлементаСписка); 
			
			Если ИмяТипа = ""Строка"" Тогда 
				Длина = Значение.Колонки.Получить(КолонкаИндекс).ТипЗначения.КвалификаторыСтроки.Длина; 	
			Иначе 
				Длина = 0;
			КонецЕсли; 
			
			ФайлXML.ЗаписатьНачалоЭлемента(""item"");
				ФайлXML.ЗаписатьАтрибут(""nameCol"", ИмяКолонки);
				ФайлXML.ЗаписатьАтрибут(""row"", XMLСтрока(СтрокаИндекс));
				ФайлXML.ЗаписатьАтрибут(""col"", XMLСтрока(КолонкаИндекс));
				ФайлXML.ЗаписатьАтрибут(""type"", ИмяТипа);
				ФайлXML.ЗаписатьАтрибут(""length"", XMLСтрока(Длина));
				ФайлXML.ЗаписатьАтрибут(""value"", XMLСтрока(ЗначениеЭлементаСписка));
			ФайлXML.ЗаписатьКонецЭлемента();
		КонецЦикла;
	КонецЦикла;
	
	//ag(!!!
	//если параметр не заполнен  - добавим пустую ТЗ
	Если СтрокаИндекс = 0 тогда
		Для КолонкаИндекс = 0 по КолКолонок - 1 Цикл 
			//ЗначениеЭлементаСписка	= Значение.Получить(СтрокаИндекс).Получить(КолонкаИндекс);
			ИмяКолонки = Значение.Колонки.Получить(КолонкаИндекс).Имя;
			// Определение имени типа.
			ИмяТипа = xmlТип(Значение.Колонки.Получить(КолонкаИндекс).ТипЗначения.Типы()[0]).ИмяТипа;
			
			
			//ИмяТипаИзЗначения(ЗначениеЭлементаСписка); 
			
			ФайлXML.ЗаписатьНачалоЭлемента(""item"");
				ФайлXML.ЗаписатьАтрибут(""nameCol"", ИмяКолонки);
				//ФайлXML.ЗаписатьАтрибут(""row"", XMLСтрока(СтрокаИндекс));
				ФайлXML.ЗаписатьАтрибут(""col"", XMLСтрока(КолонкаИндекс));
				ФайлXML.ЗаписатьАтрибут(""type"", ИмяТипа);
				//ФайлXML.ЗаписатьАтрибут(""value"", XMLСтрока(ЗначениеЭлементаСписка));
			ФайлXML.ЗаписатьКонецЭлемента();
		КонецЦикла;
	КонецЕсли;
	//ag)
		
КонецПроцедуры	

// Записывает момент времени в Файл XML.
//
// Параметры:
//	ФайлXML - записьXML.
//	Значение - момент времени.
//
Процедура ЗаписатьМоментВремениВXML(ФайлXML, Значение)
	Если ТипЗнч(Значение) <> Тип(""МоментВремени"") Тогда 
		Возврат;
	КонецЕсли;	
	
	// Определение имени типа.
	ИмяТипа = ИмяТипаИзЗначения(Значение.Ссылка); 
	
	ФайлXML.ЗаписатьНачалоЭлемента(""item"");
		Если Значение.Ссылка <> Неопределено Тогда 
			ФайлXML.ЗаписатьАтрибут(""type"", ИмяТипа);
			ФайлXML.ЗаписатьАтрибут(""valueRef"", XMLСтрока(Значение.Ссылка));
		КонецЕсли;	
		ФайлXML.ЗаписатьАтрибут(""valueDate"", XMLСтрока(Значение.Дата));
	ФайлXML.ЗаписатьКонецЭлемента();
КонецПроцедуры	

// Записывает границу.
//
Процедура ЗаписатьГраницуВXML(ФайлXML, Граница)
	Если ТипЗнч(Граница) <> Тип(""Граница"") Тогда 
		Возврат;
	КонецЕсли;	
	
	ФайлXML.ЗаписатьНачалоЭлемента(""divide"");
		// Определение имени типа.
		ИмяТипа 			= ИмяТипаИзЗначения(Граница.Значение); 
		ТипЗначенияГраницы 	= ТипЗнч(Граница.Значение);
		
		// Запись в строку вида границы.
		ИмяВидаГраницы = Строка(Граница.ВидГраницы);
		
		ФайлXML.ЗаписатьАтрибут(""type"", ИмяТипа);
		ФайлXML.ЗаписатьАтрибут(""valueDiv"", ИмяВидаГраницы);
		
		Если ТипЗначенияГраницы <> Тип(""МоментВремени"") Тогда 
			ФайлXML.ЗаписатьАтрибут(""value"", XMLСтрока(Граница.Значение));
		Иначе
			ЗаписатьМоментВремениВXML(ФайлXML, Граница.Значение);
		КонецЕсли;
	ФайлXML.ЗаписатьКонецЭлемента();
КонецПроцедуры	

// Возвращает строковое представление типа по значению.
//
// Параметры:
//	Значение - передаваемое значение.
//
Функция ИмяТипаИзЗначения(Значение) Экспорт
	Если ТипЗнч(Значение) = Тип(""Строка"") Тогда
		ИмяТипа = ""Строка"";
	ИначеЕсли ТипЗнч(Значение) = Тип(""Число"") Тогда 	
		ИмяТипа = ""Число"";
	ИначеЕсли ТипЗнч(Значение) = Тип(""Булево"") Тогда 	
		ИмяТипа = ""Булево"";
	ИначеЕсли ТипЗнч(Значение) = Тип(""Дата"") Тогда 		
		ИмяТипа = ""Дата"";
	ИначеЕсли ТипЗнч(Значение) = Тип(""МоментВремени"") Тогда 		
		ИмяТипа = ""МоментВремени"";	
	ИначеЕсли ТипЗнч(Значение) = Тип(""Неопределено"") Тогда 		
		ИмяТипа = ""Строка"";		
	Иначе	
		ИмяТипа = xmlТип(ТипЗнч(Значение)).ИмяТипа;
	КонецЕсли;	
	
	Возврат ИмяТипа;
КонецФункции	

// Определяет условие конца тэга ""query"" или ""parameters""
//
// Параметры:
//	ФайлXML - чтениеXML.
//
Функция ПроверкаКонцаТэгов(ФайлXML)
	Если (ФайлXML.ТипУзла = ТипУзлаXML.КонецЭлемента и ФайлXML.Имя = ""query"") 
		 или (ФайлXML.ТипУзла = ТипУзлаXML.КонецЭлемента и ФайлXML.Имя = ""parameters"") Тогда
		Возврат Истина;
	Иначе
		Возврат Ложь;
	КонецЕсли;	
КонецФункции	

//////////////////////////////////////////////////////////////////////////////////////////////
// для   обычной консоли 
Функция вСохранитьЗапросыВФайл(ОбъектЗапроса, ИмяФайла = ""C:\Запросы\TekZapros.sel"")

	
	ДеревоЗапросов = Новый ДеревоЗначений;
	ДеревоЗапросов.Колонки.Добавить(""Запрос"");
	ДеревоЗапросов.Колонки.Добавить(""ТекстЗапроса"");
	ДеревоЗапросов.Колонки.Добавить(""ПараметрыЗапроса"");
	ДеревоЗапросов.Колонки.Добавить(""СпособВыгрузки"");
	
	мТекущаяСтрока = ДеревоЗапросов.Строки.Добавить();
	
    мТекущаяСтрока.Запрос = ""Запросы"";	
	мТекущаяСтрока.ТекстЗапроса = ОбъектЗапроса.Текст;
	
	
	ТаблПараметров = Новый ТаблицаЗначений;
	ТаблПараметров.Колонки.Добавить(""ИмяПараметра"");
	ТаблПараметров.Колонки.Добавить(""ЭтоВыражение"");
	ТаблПараметров.Колонки.Добавить(""ЗначениеПараметра"");
	
	Для каждого ТекПараметр Из ОбъектЗапроса.Параметры Цикл
		НовСтрПар = ТаблПараметров.Добавить();
		НовСтрПар.ЗначениеПараметра =  ТекПараметр.Значение;
		НовСтрПар.ИмяПараметра		= ТекПараметр.Ключ;
		НовСтрПар.ЭтоВыражение = Ложь;
	КонецЦикла; 
	
	
	мТекущаяСтрока.ПараметрыЗапроса = ТаблПараметров;
	мТекущаяСтрока.СпособВыгрузки = 2;
	
	// и копию
    мТекущаяСтрока2 = мТекущаяСтрока.Строки.Добавить();
	
    мТекущаяСтрока2.Запрос = ""Исходный запрос"";	
	мТекущаяСтрока2.ТекстЗапроса = ОбъектЗапроса.Текст;
	мТекущаяСтрока2.ПараметрыЗапроса = ТаблПараметров;
	мТекущаяСтрока2.СпособВыгрузки = 2;

	
	ЗначениеВФайл(ИмяФайла, ДеревоЗапросов);
	
	Возврат Истина;

КонецФункции // СохранитьЗапросыВФайл()
"}
},
{0,
{"РаботаСТаблицейЗначенийВЗапросе",0,0,"","//1. Создаём таблицу значений:

    Таблица = Новый ТаблицаЗначений; 
//2. Добавляем колонки таблицы значений с указанием типа данных:

    Таблица.Колонки.Добавить(""Контрагент"", Новый ОписаниеТипов(""СправочникСсылка.Контрагенты""));
    Таблица.Колонки.Добавить(""Номенклатура"", Новый ОписаниеТипов(""СправочникСсылка.Номенклатура""));
    Таблица.Колонки.Добавить(""ЕдиницаИзмерения"", Новый ОписаниеТипов(""СправочникСсылка.ЕдиницыИзмерения""));
    Таблица.Колонки.Добавить(""Количество"", Новый ОписаниеТипов(""Число"",,, Новый КвалификаторыЧисла(15, 2, ДопустимыйЗнак.Неотрицательный)));
//3. Заполняем таблицу значений по своему алгоритму.
//4. Создаём новый запрос:

    Запрос = Новый Запрос;
    Запрос.МенеджерВременныхТаблиц = Новый МенеджерВременныхТаблиц;
    Запрос.Текст =
    
// Создаём временную таблицу из таблицы значений. Таблица значений будет передана в параметр &Таблица

    ""ВЫБРАТЬ
    | Таблица.Контрагент,
    | Таблица.Номенклатура,
    | Таблица.ЕдиницаИзмерения,
    | Таблица.Количество
    |ПОМЕСТИТЬ Таблица
    |ИЗ
    | &Таблица КАК Таблица
    |;
    |
    |////////////////////////////////////////////////////////////////////////////////
    
// Основной запрос

    |ВЫБРАТЬ
    | Таблица.Контрагент,
    | Таблица.Номенклатура,
    | Таблица.ЕдиницаИзмерения,
    | Таблица.Количество
    |ИЗ
    | Таблица КАК Таблица
    |;
    |
    |////////////////////////////////////////////////////////////////////////////////
    
// Уничтожаем временную таблицу

    |УНИЧТОЖИТЬ Таблица"";

    
// Передаём нашу таблицу значений в параметр запроса

    Запрос.УстановитьПараметр(""Таблица"", Таблица);

//5. Результат выполнения запроса может быть выгружен в табличную часть объекта:
    ТабличнаяЧасть = Запрос.Выполнить().Выгрузить();"}
}
},
{1,
{"ПрикладныеОбъкты",1,0,"",""},
{1,
{"Перечисления",1,0,"",""},
{0,
{"Получить имя перечисления",0,0,"Пер","ЗначениеПеречисления = Перечисления.ВидыКонтрагентов.Организация;

ИмяПеречисления = ЗначениеПеречисления.Метаданные().Имя;

ИндексЗначенияПеречисления = Перечисления[ИмяПеречисления].Индекс(ЗначениеПеречисления);

ИмяЗначенияПеречисления = Метаданные.Перечисления[ИмяПеречисления].ЗначенияПеречисления[ИндексЗначенияПеречисления].Имя;"}
}
}
}
}
}