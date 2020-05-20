import axios from 'axios'

const state = {
    context: 'http://localhost:3000/',
    player: {}, /* 보안을 위해 풀지 말고 그대로 보내자 */
    fail: false, /* 실패 */
    auth: false /* 권한 */
}
const mutations = {
    LOGIN_COMMIT(state, data) {
        state.auth = true
        state.player = data.player
        localStorage.setItem('token', data.token) /* 접근권한 */
        localStorage.setItem('playerId', data.player.playerId)
        if (data.player.auth === 'USER') {
            alert('일반 사용자')
            /*일반 사용자*/
        } else {
            alert('관리자')
            /* 관리자 */
        }

    },
    join() {
        alert("회원가입")
    }
}
const getters = {}

const actions = {
        async login({commit}, payload) { /*람다에서 돌아감*/
            const url = state.context + 'players/${payload.playerId}/access'
            const headers = {
                authorization: 'JWT fefege..',
                Accept: 'application/json',
                'Content-Type': 'application/json'
            }
            axios.post(url, payload, headers)
                .then(({data}) => { /* 람다 줄이는 게 안됨 */
                    alert('자바 다녀옴')
                    commit('login_commit', data)
                })
                .catch(() => {
                    alert('서버 전송 실패')
                    state.fail = true
                })
    },
    async join({commit}) {
        commit('join')
    }
}
export default {
    name: 'player',
    namespace: true, /*객체로 만들거냐*/
    state,
    actions,
    mutations,
    getters
}