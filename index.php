<?php
use infrajs\ans\Ans;
use infrajs\load\Load;
use infrajs\path\Path;
use infrajs\rubrics\Rubrics;
use infrajs\router\Router;
use infrajs\access\Access;

$ans = array();

$lim = Ans::GET('lim','string','0,100');
$p = explode(',', $lim);
if (sizeof($p) != 2) return Ans::err($ans, 'Некорректный параметр lim');
list($start, $count) = $p;

$dir = Ans::GET('src','string');
if (!$dir) return Ans::err($ans, 'Укажите обязательный параметр src');
if (!Path::isNest('~', $dir)) return Ans::err($ans, 'Указан небезопасный путь src');

$order = Ans::GET('order',['descending','ascending']);
$html = Ans::GET('html');
$ans['order'] = $order;

$list = Access::cache(__FILE__, function ($dir, $order, $html) {
	$list = array();

	array_map(function ($file) use (&$list, $dir, $html) {
		if ($file{0} == '.') return;
		$file = Path::toutf($file);
		if (!Path::theme($dir.$file)) return;
		$fd = Load::nameInfo($file);

		if (!in_array($fd['ext'], array('jpg', 'png'))) return;
		$slide = $fd;
		$slide['title'] = $fd['name'];

		$src = Rubrics::find($dir, $fd['name'], 'articles');
		if ($src) {
			$slide['src'] = $src;
			if ($html) $slide['title'] = Rubrics::article($src);
			else $slide['title'] = Load::loadTEXT($src);
		}
		$list[] = $slide;
	}, scandir(Path::theme($dir)));

	Load::sort($list, $order);
	//$list = array_reverse($list);
	return $list;
}, array($dir, $order, $html));

$list = array_slice($list, $start, $count);


$ans['dir'] = $dir;
$ans['list'] = $list;


return Ans::ret($ans);