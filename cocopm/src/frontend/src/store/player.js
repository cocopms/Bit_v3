import axios from 'axios'
import router from '../router'

const state = { /* 노테이션은 무조건 state에서 바꾸는 것 */
    context: 'http://localhost:3000/',
    player: {}, /* 보안을 위해 풀지 말고 그대로 보내자 */
    fail: false, /* 실패 */
    auth: false /* 권한 */
}
const actions = { /* payload는 이 곳에서 할당되어 객체가 됨 */
        async login({commit}, payload) { /*람다에서 돌아감, login.vue에선 playerId, passwd인데 여기선 'payload'로 이름이 다른 이유 : 이름이 없으니 메모리를 차지하지 않음 = ghost*/
            const url = state.context + 'players/${payload.playerId}/access'
            const headers = {
                authorization: 'JWT fefege..',
                Accept: 'application/json',
                'Content-Type': 'application/json'
            }
            axios.post(url, payload, headers)
                .then(({data}) => { /* 람다 줄이는 게 안됨 */
                    if(data.result){
                        commit('LOGIN_COMMIT',data) /* 성공해서 data줌 */
                    }else {
                        commit('FAIL_COMMIT')
                    }
                })
                .catch(() => {
                    alert('서버 전송 실패')
                    state.fail = true
                })
    },
    async join({commit}) {
        commit('join')
    },
    async logout({commit}) {
            commit('LOGOUT_COMMIT')
    }
}
const mutations = {
    LOGIN_COMMIT(state, data) { /* state : 맨 위 state, 성공해서 data 줌 */
        state.auth = true
        state.player = data.player
        localStorage.setItem('token', data.token) /* token : 접근권한, 캐시 */
        localStorage.setItem('playerId', data.player.playerId) /* 캐시 */
        if (data.player.teamid === 'K01') {
            alert('일반 사용자')
            router.push('/')
        } else {
            alert('관리자')
        }
    },
    FAIL_COMMIT(state) { /* 3번 이상 로그인 실패 시 잠김 */
        state.fail = true
    },
    LOGOUT_COMMIT(state) {
        localStorage.clear()
        state.auth = false
        state.player = {}
    },
    join() {
        alert("회원가입")
    }
}
const getters = {}
export default {
    name: 'player',
    namespaced: true, /*객체로 만들거냐*/
    state,
    actions,
    mutations,
    getters
}