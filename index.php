<?php
use infrajs\ans\Ans;
use infrajs\load\Load;
use infrajs\path\Path;
use infrajs\rubrics\Rubrics;
use infrajs\router\Router;
use infrajs\access\Access;

if (!is_file('vendor/autoload.php')) {
	chdir('../');
	require_once('vendor/autoload.php');
	Router::init();
}

$ans = array();



$dir = Ans::GET('src','string');
if (!$dir) return Ans::err($ans, 'Укажите обязательный параметр src');
if (!Path::isNest('~', $dir)) return Ans::err($ans, 'Указан небезопасный путь src');

$list = Access::cache(__FILE__, function ($dir) {
	$list = array();
	array_map(function ($file) use (&$list, $dir) {
		if ($file{0} == '.') return;
		$file = Path::toutf($file);
		if (!Path::theme($dir.$file)) return;
		$fd = Load::nameInfo($file);

		if (!in_array($fd['ext'], array('jpg', 'png'))) return;
		$slide = $fd;
		$slide['title'] = $fd['name'];

		$src = Rubrics::find($dir, $fd['name'], 'articles');
		if ($src) $slide['title'] = Rubrics::article($src);
		$list[] = $slide;	
	}, scandir(Path::theme($dir)));
	return $list;
}, array($dir));


$ans['dir'] = $dir;
$ans['list'] = $list;


return Ans::ret($ans);