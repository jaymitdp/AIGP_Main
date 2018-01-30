<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>AIGP</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, width=device-width">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/webLayout/AIGP.png" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/webLayout/style.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/webLayout/framework.css">
<style>.footer{display:none!important;}</style>
</head>
<body>
<div id="dev-wrapper" class="xlarge-frame">
	<div class="wrapper-one">
		<div class="wrapper-two">
			<iframe class="dev-frame" id="iframe1" name="devframeL" src="lockscreen"></iframe>
			<img class="preload" src="webLayout/preload.gif" style="display: none;">
		</div>
	</div>
</div>
<div id="dev1-wrapper" class="xxlarge-frame">
	<div class="wrapper-one">
		<iframe class="dev-frame" id="iframe2" name="devframeR" src="pumpLayout/views/StatusView.jsp"></iframe>
		<img class="preload" src="webLayout/preload.gif" style="display: none;">
	</div>
</div>
</body>
</html>