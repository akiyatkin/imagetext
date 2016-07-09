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

Данные в json доступны по адресу ```/-imagetext/?src=~путь до папки/```
Папка должна быть в data/ согласно правилам [infrajs/path](http://github.com/infrajs/path)
Должен быть настроен [infrajs/router](http://github.com/infrajs/router)

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

[Пример](http://akm63.ru)