"use strict"
var user = user || {}

user = (()=> { // 즉시실행, 우선처리, 모듈패턴이라고도 함
	const ERROR = `호출하는 JS 파일을 찾지 못했습니다.`
	let admin_vue
	let init = () => {
		admin_vue = `resources/vue/admin_vue.js`
		onCreate()
	}
	let onCreate = () => {
		$.when(
			$.getScript(admin_vue)
		).done(() => {
			setContentView()
			$('#register_a').click(e => { //관리자등록
				e.preventDefault()
				$('#content').empty()
				$('#content').html(adminVue.join())
				$(`<input type="button"/>`)
				.attr({value:'등록'})
				.css({width: '200px', height: '100px','font-size': '30px'})
				.appendTo('#button_box')
				.click(e => {
					location.href = '/admin'
				})
				$(`<input type="button"/>`)
				.attr({value:'취소'})
				.css({width: '200px', height: '100px','font-size': '30px'})
				.appendTo('#button_box')
				.click(e => {
					location.href = '/home'
				})
			})
			$('#access_a').click(e => { //관리자접속
				e.preventDefault()
				$('#content').empty()
				$('#content').html(adminVue.login())
				$(`<input type="button"/>`) //template은 그대로 냅두고 값만 바뀔 때
				.attr({value:'등록'})
				.appendTo('#login_box')
				.click(e => {
					e.preventDefault()
					location.href = '/admin'
				})
				$(`<input type="button"/>`)
				.attr({value:'취소'})
				.appendTo('#login_box')
				.click(e => {
					e.preventDefault()
					location.href = '/home'
				})
			}) 
		}).fail(() => { //왜? then이 아니고?
			alert(ERROR)
		})
	}
	let setContentView = () =>{
		$('#kcdc').css({ width: '80%', height: '900px' }).addClass('border_black center')
	     $('#tr_1').css({ width: '80%', height: '50px' }).addClass('border_black center')
	     $('#menu').css({ width: '80%', height: '50px' }).addClass('border_black center')
	     $('#kcdc td').addClass('border_black', 'width_full')
	}
	return {init}
})()