## Данные из папки, картинка с текстом

## Установка через composer


```json
{
	"require":{
		"akiyatkin/imagetext":"~1"
	}	
}
```

## Использование

Данные в json доступны по адресу ```/-imagetext/?src=~путь до папки/&order=ascending```
Папка должна быть в data/ согласно правилам [infrajs/path](http://github.com/infrajs/path)
Должен быть настроен [infrajs/router](http://github.com/infrajs/router).

Параметр ```order``` может быть ascending или descending распространяется только на порядок названий с цифрами в начале. Буквы сортируются в порядке алфавита в обоих случаях. Согласно расширению [infrajs/load](http://github.com/infrajs/load).

## Готовые слои

### Виджит слайды
```json
{
	"external":"-imagetext/slides.layer.json"
}
```

### Виджит шаги
```json
{
	"external":"-imagetext/steps.layer.json"
}
```

### Виджит преимущества
```json
{
	"external":"-imagetext/advantage.layer.json"
}
```

Примеры
[akm63.ru](http://akm63.ru), [centr-gravirovki.ru](http://centr-gravirovki.ru)