<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!-- isErrorPage="true" : exception 객체를 내장 객체로 할당 -->
<script>
	alert("${exception.message}");
	location.href="${exception.url}";
</script>