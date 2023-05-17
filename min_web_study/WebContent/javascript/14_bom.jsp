<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JS - Bom(Browser Object Model)</title>
<Script>
	let w = window.innerWidth;
	let h = window.innerHeight;
	
	document.write("w: " + w + '<br>');
	document.write("h: " + h);
	
	function locationPage(page) {
		if(page == 'naver')
			window.open('about:_blank').location.href = 'https://naver.com';
		if(page == 'google')
			window.open('about:_blank').location.href = 'https://google.co.kr';
		if(page == 'daum')
			window.open('about:_blank').location.href = 'https://daum.net';
	}
	
	function historyPage(page) {
		let hlength = window.history.length;
		alert(hlength);
		if (page == 'prev')
			window.history.back();
		if (page == 'next')
			window.history.forward();
		if (page == 'go2')
			window.history.go(2);
	}
</Script>
<style>
	button {
		width: 120px;
		padding: 10px 0;
		background: cyan;
		border:1px solid lightgray;
		border-radius: 4px;
		cursor: pointer;
	}
	button:hover {
		text-decoration: underline;
	}
</style>
</head>
<body>
	<h1>Browser Object Model</h1>
	<button type="button" onclick="locationPage('naver')">네이버</button>
	<button type="button" onclick="locationPage('google')">구글</button>
	<button type="button" onclick="locationPage('daum')">다음</button>
	<button type="button" onclick="historyPage('prev')">Prev</button>
	<button type="button" onclick="historyPage('next')">Next</button>
	<button type="button" onclick="historyPage('go2')">Go page 2</button>
</body>
</html>