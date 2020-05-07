"use strict"
var admin = admin || {}
admin = (() => {
	const ERROR = `호출하는 JS 파일을 찾지 못했습니다.`
	let user_vue
	let init = () => { // 호출되는 함수
		user_vue = `resources/vue/user_vue.js`
		onCreate()
	}
	let onCreate = () => { // 감춰지는 함수(clsoure, 보안)
		$.when(
			$.getScript(user_vue)
		) .done(() => {
			setContentView()
			$.getJSON('/users/list', d=> {
				$('#total_count').text('총 회원수 : '+d.length)
				$.each(d, (i, j) => { //i : 순서, j : object
					$(`
					<tr>
                	<td>
                        <span>${i+1}</span>
                    </td>
                    <td>
                        <span>${j.userid}</span>
                    </td>
                    <td>
                        <span id="user_`+(i+1)+`"></span>
                    </td>
                     <td>
                        <span>${j.ssn}</span>
                    </td>
                   <td>
                        <span>${j.email}</span>
                    </td>
                    <td>
                        <span>${j.phoneNumber}</span>
                    </td>
                    <td>
                        <span>${j.registerDate}</span>
                    </td>
                </tr>
                `
				).appendTo('#userData')
			
				$(`<a>${j.name}</a>`) //??
				.css({cursor: 'pointer', color: 'blue'})
				.appendTo('#user_'+(i+1))
				.click(e => {
					$('#userData').empty()
					$(userVue.detail())
					.appendTo('#userData') //userData table에 detail을 넣는다
					$.getJSON(`/users/${j.userid}`, d=> { //왜?
						$('#userid').text(d.userid)
						$('#name').text(d.name)
						$('#ssn').text(d.ssn)
						$('#addr').text(d.addr)
						$('#email').text(d.email)
						$('#phoneNumber').text(d.phoneNumber)
						$('#registerDate').text(d.registerDate)
					})
				})
			})
		})
		.fail(()=>{
			alert(ERROR)
		})
	})
		$('.user_list').click(e => {
			e.preventDefault()
			location.href = '/admin'
		})
		$('.item_list').click( e => {
			e.preventDefault()
			$('#content').empty()
			$('#content').html(`
					<table id="itemData">
						<tr>
							<th id="number">No.</a></th>
							<th id="itemId">분실물ID</th>
							<th id="itemName">습득물품명</th>
							<th id="takeDate">습득일자</th>
							<th id="category">습득물분류</th>
							<th id="takePlace">습득위치(지하철)</th>
						</tr>
					</table>
			`)
				setContentView()
			$.getJSON('/items', d => {
				$.each(d, (i, j) => {
					$(`
					<tr>
					<td>
                        <span>${i+1}</span>
                    </td>
		            <td>
		                <span>${j.itemId}</span>
		            </td>
		            <td>
		                 <span>${j.itemName}</span>
		            </td>
		            <td>
		                 <span>${j.takeDate}</span>
		            </td>
		            <td>
		                 <span>${j.category}</span>
		             </td>
		             <td>
		                 <span>${j.takePlace}</span>
		             </td>
		             </tr>
		                `).appendTo('#itemData')
				})
			})	
		})
	}
		let setContentView = () => {
			$('#userData tr').first().css({'background-color':'yellow'}) //굳이 first를 쓰는 이유
		}
		return {init}
})()