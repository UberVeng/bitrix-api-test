<?php
require($_SERVER['DOCUMENT_ROOT'].'/bitrix/modules/main/include/prolog_before.php');

\Bitrix\Main\Loader::includeModule('iblock');

header('Content-Type: application/json; charset=utf-8');

$pageSize = 10;
$pageNumber = 1;
$pageSizeLimit = 50;

if (isset($_GET["page_size"]) && is_int((int)$_GET["page_size"]) && $_GET["page_size"] > 0 && $_GET["page_size"] < $pageSizeLimit) {
	$pageSize = $_GET["page_size"];
} else {
	$pageSize = $pageSizeLimit;
}

if (isset($_GET["page_number"]) && is_int((int)$_GET["page_number"]) && $_GET["page_number"] > 0) {
	$pageNumber = $_GET["page_number"];
}

$arSelect = Array("NAME", "DATE_CREATE", "DETAIL_PICTURE", "DETAIL_TEXT");
$arFilter = Array("IBLOCK_ID"=>2, "ACTIVE"=>"Y");
$res = CIBlockElement::GetList(Array(), $arFilter, false, Array("nPageSize"=>$pageSize, "iNumPage" => $pageNumber), $arSelect);
$out = [];

while($ar = $res->fetch())
{
 foreach ($ar as $key => $value) {
	if ($key == "DETAIL_PICTURE") {
		$ar[$key] = CFile::GetPath($value);
	}	
	if ($key == "DETAIL_TEXT_TYPE") {
		unset($ar[$key]);
	}
 }
 $out[] = ($ar);
}

echo json_encode($out);