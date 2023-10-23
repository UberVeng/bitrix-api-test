<?php
require($_SERVER['DOCUMENT_ROOT'].'/bitrix/modules/main/include/prolog_before.php');

\Bitrix\Main\Loader::includeModule('iblock');

header('Content-Type: application/json; charset=utf-8');

$pageSizeLimit = 50;

$pageSize = (int)$_GET["page_size"];
$pageSize = $pageSize > 0  && $pageSize <= $pageSizeLimit ? $pageSize : 10;

$pageNumber = (int)$_GET["page_number"];
$pageNumber = $pageNumber > 0 ? $pageNumber : 1;

$arSelect = Array("NAME", "DATE_CREATE", "DETAIL_PICTURE", "DETAIL_TEXT");
$arFilter = Array("IBLOCK_ID"=>2, "ACTIVE"=>"Y");
$res = CIBlockElement::GetList(Array(), $arFilter, false, Array("nPageSize"=>$pageSize, "iNumPage" => $pageNumber), $arSelect);
$out = [];

while($ar = $res->fetch())
{
	$ar["DETAIL_PICTURE"] = CFile::GetPath($ar["DETAIL_PICTURE"]);
	unset($ar["DETAIL_TEXT_TYPE"]);
	$out[] = $ar;
}

echo json_encode($out);