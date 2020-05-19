const state = {
    userid: '',
    passwd: ''
}
const actions = {
    login({commit}) { /*람다에서 돌아감*/
        {
            commit('login')
        }
    },
    join({commit}) {
        {
            commit('join')
        }
    }
}
const mutations = {
    increment(state) {
        state.count++
        state.history.push('increment')
    },
    decrement(state) {
        state.count--
        state.history.push('decrement')
    }
}
const getters = {
    count(state) {return state.count},
    limit : 5,
    recentHistory (state) {
        const end = state.history.length
        const begin = end - limit < 0 ? 0 : end - limit
        return state.history.slice(begin, end).join(', ')
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