"use strict"
var userVue = {
		detail : () => {
			return `
			<div id="content_container">
				<table>
					<tr>
						<td id="title" colspan="3">사용자 정보</td>
					</tr>
					<tr>
						<td id="profile_pic" rowspan="7">
							<svg id="profile_pic_default" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
								<path d="M3 5v14c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5c-1.11 0-2 .9-2 2zm12 4c0 1.66-1.34 3-3 3s-3-1.34-3-3 1.34-3 3-3 3 1.34 3 3zm-9 8c0-2 4-3.1 6-3.1s6 1.1 6 3.1v1H6v-1z" />
								<path d="M0 0h24v24H0z" fill="none" />
							</svg>
						</td>
						<td class="userlabel">아이디</td>
						<td class="input">
							<p id="userId"></p>
						</td>
					</tr>
					<tr>
						<td class="userlabel">이름</td>
						<td class="input">
							<p id="userName"></p>
						</td>
					</tr>
					<tr>
						<td class="userlabel">주민번호</td>
						<td class="input">
							<p id="userSSN"></p>
						</td>
					</tr>
					<tr>
						<td class="userlabel">주소</td>
						<td class="input">
							<p id="userAddr"></p>
						</td>
					</tr>
					<tr>
						<td class="userlabel">이메일</td>
						<td class="input">
							<p id="userEmail"></p>
						</td>
					</tr>
					<tr>
						<td class="userlabel">전화번호</td>
						<td class="input">
							<p id="userPhoneNumber"></p>
						</td>
					</tr>
					<tr>
						<td class="userlabel">가입일</td>
						<td class="input">
							<p id="registerDate"></p>
						</td>
					</tr>
				</table>
			</div>
			`
		}
}